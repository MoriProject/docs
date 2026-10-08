# mori-admin-console

MORI ART · BIZ · LINKVIA 통합 운영 콘솔 (사내 전용, 프론트엔드).
기존 어드민 `mori-admin`, `mori-admin-rev`, `linkvia-admin`을 대체한다.
`mori-admin-rev`는 archive되어 더 이상 사용하지 않는다. 새 어드민 화면은 이 레포에만 추가한다.

- **레포**: `MoriProject/mori-admin-console`
- **경로**: `/Users/jimin/Documents/projects/mori-admin-console`
- **스택**: Next.js 15, React 19, TypeScript, Tailwind 4 (다크 전용)
- **배포**: Vercel (접근 통제는 Vercel Deployment Protection)

## 연동 관계

- ART · BIZ 운영 데이터: MORI Biz WAS `/api/v2/admin` (서비스 계정 세션)
- 부스모리 운영(프리미엄 지급 등): MORI Art WAS `/api/admin/mori-lite/*` (`ADMIN_CONSOLE_API_KEY`, 서버 전용)
- LINKVIA: Supabase (`service_role`, 서버 전용)
