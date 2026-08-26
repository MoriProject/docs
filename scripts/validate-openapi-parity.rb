require 'yaml'

HTTP_METHODS = %w[get post put patch delete options head trace].freeze
paths = ARGV.map do |path|
  spec = YAML.safe_load(File.read(path), aliases: true)
  operations = spec.fetch('paths').flat_map do |route, item|
    item.filter_map do |method, operation|
      next unless HTTP_METHODS.include?(method)

      [method.upcase, route, operation.fetch('operationId')]
    end
  end.sort
  [path, operations]
end

abort "OpenAPI operations differ: #{paths.map(&:first).join(' vs ')}" unless paths.map(&:last).uniq.one?
ids = paths.first.last.map(&:last)
abort 'Duplicate operationId found' unless ids.uniq.length == ids.length
puts "OpenAPI parity OK: #{ids.length} operations across #{paths.length} specs"
