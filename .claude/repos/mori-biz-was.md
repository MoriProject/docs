# mori-biz-was

BIZ MORI WAS (Web Application Server) — API 엔드포인트 스펙의 원본 소스.

- **경로**: `/Users/jimin/Documents/GitHub/was/mori-biz-was`
- **스택**: Node.js 20, Express.js, MySQL, DynamoDB, Redis, BullMQ
- **도메인**: `api.bizmori.com` (prod), `api.dev.bizmori.com` (dev)

## 연동 관계

- 이 문서의 OpenAPI 스펙은 WAS의 Swagger/라우터 정의에서 파생
- `x-public: true`로 마킹된 엔드포인트만 문서화 대상
- WAS 엔드포인트 변경 시 docs의 OpenAPI 스펙도 동기화 필요

## 스펙 참조용 주요 파일

- 라우터: `src/api/routes/orderRouter.js`
- 컨트롤러: `src/api/controllers/orderController.js`
- 스키마: `src/api/middlewares/orderSchemas.js`
- 쿼리 서비스: `src/api/services/orderQueryService.js`
