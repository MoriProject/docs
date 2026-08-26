> **Customize this file**: Tailor this template to your project by noting specific contribution types you're looking for, adding a Code of Conduct, or adjusting the writing guidelines to match your style.

# Contribute to the documentation

Thank you for your interest in contributing to our documentation! This guide will help you get started.

## How to contribute

### Option 1: Edit directly on GitHub

1. Navigate to the page you want to edit
2. Click the "Edit this file" button (the pencil icon)
3. Make your changes and submit a pull request

### Option 2: Local development

1. Fork and clone this repository
2. Install the Mintlify CLI: `npm i -g mint`
3. Create a branch for your changes
4. Make changes
5. Navigate to the docs directory and run `mint dev`
6. Preview your changes at `http://localhost:3000`
7. Commit your changes and submit a pull request

For more details on local development, see our [development guide](development.mdx).

## Writing guidelines

- **Use active voice**: "Run the command" not "The command should be run"
- **Address the reader directly**: Use "you" instead of "the user"
- **Keep sentences concise**: Aim for one idea per sentence
- **Lead with the goal**: Start instructions with what the user wants to accomplish
- **Use consistent terminology**: Don't alternate between synonyms for the same concept
- **Include examples**: Show, don't just tell

## Validation

Run the following checks before submitting a documentation pull request:

```bash
mint broken-links
npx --yes @redocly/cli lint api-reference/openapi.yaml ko/api-reference/openapi.yaml ja/api-reference/openapi.yaml
ruby scripts/validate-openapi-parity.rb api-reference/openapi.yaml ko/api-reference/openapi.yaml ja/api-reference/openapi.yaml
ruby scripts/validate-openapi-description-links.rb api-reference/openapi.yaml ko/api-reference/openapi.yaml ja/api-reference/openapi.yaml
```

The OpenAPI description link validator checks root-relative Markdown links
against existing `.mdx` pages because `mint broken-links` does not inspect
links embedded in OpenAPI YAML strings.

The root `redocly.yaml` extends the recommended ruleset. The only allowed
exception is `no-ambiguous-paths: off`, which documents the existing Express
backward-compatible route overlap. Do not add other lint exceptions.
