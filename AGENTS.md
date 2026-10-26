# BIZ MORI API Documentation

## About this project

- This is the public API documentation for [BIZ MORI](https://app.contentcare.ai), built on [Mintlify](https://mintlify.com)
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

<!-- contentcare-naming:start -->
## ContentCare 명명 규칙 (2026-10-26)

제품 이름이 BIZ MORI에서 **ContentCare**로 바뀌었다. 이 저장소의 문서는 머지하면 바로 게시된다. 이 파일도 공개 사이트에 게시되므로 내부 인프라 이름을 적지 않는다.

- 새로 쓰는 문서 문구·제목·예제에는 `ContentCare`를 쓴다. `BIZ MORI`·`MORI BIZ`·`BizMori`·`bizmori`를 새로 쓰지 않는다. 예제 환경변수는 `CONTENTCARE_API_KEY`처럼 쓴다.
- 고객 연동이 의존하는 옛 이름은 호환용으로 남아 있다: 웹훅 서명 헤더 `X-MoriBiz-Signature`, MCP 설정 변수 `BIZMORI_*`, SDK `@bizmori/sdk`, 오류 번호 `BIZMORI-nnnn`. 새 이름(`X-ContentCare-Signature`, `CONTENTCARE_*`, `@contentcare/sdk`)이 **운영에 배포된 뒤에만** 문서에서 새 이름을 기본으로 안내하고, 옛 이름은 호환용으로 함께 적는다.
- 도메인·이메일 주소는 현재 상태를 따른다.
  - 연락처 메일은 `@contentcare.ai`를 쓴다(`support@`·`legal@`·`privacy@`·`security@contentcare.ai`). `@bizmori.com` 연락처를 새로 쓰지 않는다.
  - 콘솔(개발자 포털)은 `https://app.contentcare.ai`를 쓴다(`app.bizmori.com`은 308으로 넘어감). 경로는 그대로 둔다(예: `/pricing`).
  - 문서·API·상태 페이지 도메인(`docs.bizmori.com`, `api.bizmori.com`, `status.bizmori.com`)은 전환이 끝나기 전까지 그대로 둔다. `docs.contentcare.ai`는 Mintlify 커스텀 도메인과 DNS가 연결된 뒤에만 쓴다.
  - 약관·개인정보처리방침의 서비스명(`BizMORI`)과 시행일은 법무 확인 없이 바꾸지 않는다.
- 운영에 없는 기능이나 이름을 먼저 게시하지 않는다.
<!-- contentcare-naming:end -->
