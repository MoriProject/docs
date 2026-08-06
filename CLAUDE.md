# CLAUDE.md

This file provides guidance to Claude Code for the MORI API documentation project.

## Related BIZ Repositories

@.claude/repos/mori-biz-was.md
@.claude/repos/mori-biz-aws.md
@.claude/repos/mori-admin-rev.md

## Project Overview

MORI BIZ public API documentation built with [Mintlify](https://mintlify.com).

- **Site**: https://app.bizmori.com
- **Framework**: Mintlify
- **Languages**: English (default) + Korean (`ko/`) + Japanese (`ja/`)

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
├── ko/                          # Korean translations (mirrors root structure)
└── ja/                          # Japanese translations (mirrors root structure)
```

## Related Repositories

- **mori-biz-was**: `/Users/jimin/Documents/GitHub/was/mori-biz-was` — API 서버 소스코드. 엔드포인트 스펙 원본 확인 시 참조 (orderRouter.js, orderController.js, orderSchemas.js, orderQueryService.js 등)

## Key Conventions

- **OpenAPI spec** (`api-reference/openapi.yaml`) is derived from `mori-biz-was` Swagger files. Only `x-public: true` endpoints are included. Do not manually add endpoints that are not marked public.
- **Korean translations** live under `ko/` and **Japanese** under `ja/`; both mirror the root file structure.
- **MDX pages** follow Mintlify front matter format (`title`, `description`, `openapi`, etc.).
- When adding a new page, register it in `docs.json` under the appropriate navigation group.

## Page Registration Rules in docs.json

### API Reference — all languages use MDX wrapper files

Every language registers API pages the same way: one **MDX wrapper file** per endpoint, registered by file path. Do not declare `"openapi"` at the group level.

```json
{
  "group": "Anti-AI",
  "pages": [
    "ko/api-reference/anti-ai/create-order",
    "ko/api-reference/anti-ai/confirm-order",
    "ko/api-reference/anti-ai/create-order-urls"
  ]
}
```

Each MDX file contains only frontmatter:

```mdx
---
title: "프리사인드 URL 갱신"
openapi: "/ko/api-reference/openapi.yaml POST /api/v2/orders/{orderId}/refresh-urls"
---
```

- **`openapi` must start with that language's spec path.** Without the prefix Mintlify binds the operation to whichever registered spec it resolves first, which is how the earlier prefix-less `ko/` wrappers broke. Use `/api-reference/…` for English, `/ko/api-reference/…` for Korean, `/ja/api-reference/…` for Japanese.
- `title` is the operation's `summary` from that language's spec.
- Add documentation below the frontmatter (code snippets, warnings, notes) as needed.
- Wrapper filenames are identical across languages, so URLs stay parallel: `api-reference/orders/refresh-urls`, `ko/api-reference/orders/refresh-urls`, `ja/api-reference/orders/refresh-urls`.

**Do not register endpoints as `"METHOD /path"` strings.** That form makes Mintlify auto-generate the page URL by slugifying the localized `summary` (e.g. `/api-reference/orders/프리사인드-url-갱신`), which produces unstable non-ASCII paths, drops the language prefix, and cannot be linked to — `mint broken-links` reports every such link as broken.

### Linking to API Reference pages

Link by wrapper file path within the same language: `/ko/api-reference/orders/refresh-urls`. Run `mint broken-links` after adding links; it must report **no broken links**.

### Localized group name convention

- **Guide tab** (`가이드` / `ガイド`): group names are translated
- **API Reference tab** (`API 레퍼런스` / `API リファレンス`): group names are kept in **English** (e.g., `"Anti-AI"`, `"Watermark-Embed"`, `"Orders"`, `"Webhooks"`)

### Endpoint list parity

The Korean and Japanese API Reference endpoint lists must match the English side unless an endpoint is intentionally excluded. When removing or adding an endpoint, update **all three** language sections in `docs.json` together, and add the matching wrapper file for each language.

## Writing Guidelines

- Use active voice and address the reader as "you"
- Keep sentences concise; one idea per sentence
- Lead instructions with the user's goal
- Always include code examples for API usage
- Korean (`ko/`) and Japanese (`ja/`) pages should be full translations, not summaries
- Japanese pages write "watermark" in English rather than ウォーターマーク, with a half-width space between it and adjacent kana/kanji (e.g. `不可視 watermark の埋め込み`)
