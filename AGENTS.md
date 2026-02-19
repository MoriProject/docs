# MORI API Documentation

## About this project

- This is the public API documentation for [MORI BIZ](https://developers.mori.art), built on [Mintlify](https://mintlify.com)
- Pages are MDX files with YAML frontmatter
- Configuration lives in `docs.json`
- API reference is auto-generated from `api-reference/openapi.yaml` (OpenAPI 3.0 spec)
- Run `mint dev` to preview locally
- Run `mint broken-links` to check links

## Terminology

- Use "order" not "request" for processing jobs
- Use "Anti-AI" (hyphenated, capitalized) for the image protection service
- Use "watermark embed" / "watermark extract" for watermark services
- Use "presigned URL" not "pre-signed URL" or "signed URL"
- Use "API key" not "API token" or "access key"

## Style preferences

- Documentation is written in English
- Use active voice and second person ("you")
- Keep sentences concise
- Use sentence case for headings
- Bold for UI elements: Click **Settings**
- Code formatting for file names, commands, paths, and code references
- Include code examples in cURL, Node.js, and Python where possible

## Content boundaries

- Only document public API endpoints (marked with `x-public: true` in source swagger)
- Do not document internal APIs, admin APIs, or dashboard APIs
- Do not include internal implementation details or database schemas
