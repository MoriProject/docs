# CLAUDE.md

This file provides guidance to Claude Code for the MORI API documentation project.

## Project Overview

MORI BIZ public API documentation built with [Mintlify](https://mintlify.com).

- **Site**: https://developers.mori.art
- **Framework**: Mintlify
- **Languages**: English (default) + Korean (`ko/`)

## Local Development

```bash
npm i -g mintlify
mintlify dev
# Preview at http://localhost:3000
```

## Project Structure

```
.
├── docs.json                    # Mintlify config (nav, colors, tabs)
├── index.mdx                   # Introduction page
├── authentication.mdx
├── quickstart.mdx
├── errors.mdx
├── webhooks.mdx
├── api-reference/
│   ├── openapi.yaml             # OpenAPI 3.0 spec (public endpoints only)
│   ├── introduction.mdx
│   ├── anti-ai/
│   ├── watermark-embed/
│   ├── watermark-extract/
│   ├── orders/
│   └── webhooks/
└── ko/                          # Korean translations (mirrors root structure)
```

## Key Conventions

- **OpenAPI spec** (`api-reference/openapi.yaml`) is derived from `mori-biz-was` Swagger files. Only `x-public: true` endpoints are included. Do not manually add endpoints that are not marked public.
- **Korean translations** live under `ko/` and mirror the root file structure.
- **MDX pages** follow Mintlify front matter format (`title`, `description`, `openapi`, etc.).
- When adding a new page, register it in `docs.json` under the appropriate navigation group.

## Page Registration Rules in docs.json

### English API Reference (default language)

English API pages use individual **MDX wrapper files** registered by file path:

```json
{
  "group": "Anti-AI",
  "pages": [
    "api-reference/anti-ai/create-order",
    "api-reference/anti-ai/confirm-order"
  ]
}
```

Each MDX file (e.g., `api-reference/anti-ai/create-order.mdx`) must include:
- `openapi: "METHOD /path"` frontmatter to bind the OpenAPI operation
- Additional documentation below the generated block (code snippets, warnings, notes) as needed

### Korean API Reference (`language: "ko"`)

Korean API pages do **NOT** use individual MDX wrapper files. Instead, register endpoints directly as `"METHOD /path"` strings and declare `"openapi"` at the group level:

```json
{
  "group": "Anti-AI",
  "openapi": "/ko/api-reference/openapi.yaml",
  "pages": [
    "POST /api/v2/orders/anti-ai",
    "POST /api/v2/orders/anti-ai/confirm",
    "POST /api/v2/orders/anti-ai/with-urls"
  ]
}
```

### Korean group name convention

- **Guide tab** (`가이드`): group names are translated into Korean (e.g., `"시작하기"`, `"가이드"`)
- **API Reference tab** (`API 레퍼런스`): group names are kept in **English** (e.g., `"Anti-AI"`, `"Watermark-Embed"`, `"Orders"`, `"Webhooks"`)

### Endpoint list parity

The Korean API Reference endpoint list must match the English side unless an endpoint is intentionally excluded. When removing or adding an endpoint, update **both** language sections in `docs.json` together.

## Writing Guidelines

- Use active voice and address the reader as "you"
- Keep sentences concise; one idea per sentence
- Lead instructions with the user's goal
- Always include code examples for API usage
- Korean pages (`ko/`) should be full translations, not summaries
