# mori-biz-aws

BIZ MORI 워터마크 처리 AWS 서버리스 백엔드.

- **경로**: `/Users/jimin/Documents/GitHub/aws/mori-biz-aws`
- **스택**: Python 3.12, AWS CDK, Lambda, SQS, DynamoDB, Fargate

## 연동 관계

- 문서에서 설명하는 워터마크 삽입/추출 API의 실제 처리를 담당
- WAS가 주문을 받으면 AWS 파이프라인이 비동기로 처리 → 웹훅으로 결과 통보
- 문서의 주문 상태 흐름(`pending` → `inProgress` → `complete`/`failed`) 중 처리 단계를 수행
