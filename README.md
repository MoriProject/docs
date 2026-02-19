# MORI API Documentation

Public API documentation for [MORI BIZ](https://developers.mori.art), built with [Mintlify](https://mintlify.com).

## Local development

Install the [Mintlify CLI](https://www.npmjs.com/package/mintlify) to preview changes locally:

```bash
npm i -g mintlify
mintlify dev
```

View your local preview at `http://localhost:3000`.

## Project structure

```
.
├── docs.json                    # Mintlify configuration
├── index.mdx                   # Introduction page
├── authentication.mdx           # Authentication guide
├── quickstart.mdx               # Quickstart guide
├── errors.mdx                  # Error codes reference
├── webhooks.mdx                # Webhooks guide
└── api-reference/
    ├── openapi.yaml             # OpenAPI 3.0 spec (public endpoints only)
    ├── introduction.mdx         # API reference overview
    ├── anti-ai/                 # Anti-AI endpoints
    ├── watermark-embed/         # Watermark Embed endpoints
    ├── watermark-extract/       # Watermark Extract endpoints
    ├── orders/                  # Order query endpoints
    └── webhooks/                # Webhook management endpoints
```

## API spec

The OpenAPI spec (`api-reference/openapi.yaml`) is derived from the source Swagger files in the `mori-biz-was` repository (`src/docs/*.swagger.yaml`). Only `x-public: true` endpoints are included.

To update the spec, modify the source swagger files and regenerate the public spec.

## Publishing changes

Install the Mintlify GitHub app from your [dashboard](https://dashboard.mintlify.com/settings/organization/github-app) to propagate changes from your repo to your deployment. Changes are deployed to production automatically after pushing to the default branch.
