#!/usr/bin/env ruby

require 'pathname'
require 'yaml'

DOCS_ROOT = Pathname.new(__dir__).parent.realpath
MARKDOWN_LINK = /(?<!!)\[[^\]]+\]\((\/[^\s\)]+)\)/

def each_string(value, path = '$', &block)
  case value
  when Hash
    value.each { |key, child| each_string(child, "#{path}.#{key}", &block) }
  when Array
    value.each_with_index { |child, index| each_string(child, "#{path}[#{index}]", &block) }
  when String
    yield value, path
  end
end

def page_candidates(target)
  route = target.split(/[?#]/, 2).first
  return [] if route.nil? || route.empty? || route.start_with?('//')

  relative = route.delete_prefix('/').delete_suffix('/')
  return [] if relative.empty? || Pathname.new(relative).each_filename.include?('..')

  if File.extname(relative) == '.mdx'
    [DOCS_ROOT.join(relative)]
  else
    [DOCS_ROOT.join("#{relative}.mdx"), DOCS_ROOT.join(relative, 'index.mdx')]
  end
end

spec_paths = ARGV.empty? ? %w[api-reference/openapi.yaml ko/api-reference/openapi.yaml ja/api-reference/openapi.yaml] : ARGV
failures = []

spec_paths.each do |spec_path|
  absolute_spec_path = DOCS_ROOT.join(spec_path).cleanpath
  document = YAML.safe_load_file(absolute_spec_path, aliases: true)

  each_string(document) do |text, yaml_path|
    text.scan(MARKDOWN_LINK).flatten.uniq.each do |target|
      candidates = page_candidates(target)
      next if candidates.any?(&:file?)

      failures << "#{spec_path}:#{yaml_path}: #{target} -> existing .mdx page not found"
    end
  end
end

if failures.any?
  warn "OpenAPI description internal link validation failed (#{failures.length}):"
  failures.each { |failure| warn "- #{failure}" }
  exit 1
end

puts "OpenAPI description internal links valid (#{spec_paths.length} specs)"
