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

## 패치노트 발행 규칙

`/changelog`(패치노트 · What's new · パッチノート)에 올리는 릴리스 노트의 규칙입니다.

**기준 사례**: `ko/changelog.mdx`의 `1.1.0` 블록(영어 `changelog.mdx`, 일본어 `ja/changelog.mdx`). 새 회분은 1.1.0과 나란히 놓았을 때 구분이 안 될 만큼 같은 형식이어야 합니다. 형식의 원형은 [Manyfast 업데이트 노트](https://forum.manyfast.io/announcements?type=UPDATE)입니다.

### 0. 작업 절차

1. **소스 수집** — Linear 프로젝트 `BIZMORI - N월 업데이트`에서 상태가 **Done**인 이슈를 모읍니다. 사용자가 이슈 번호를 주면 그 목록만 씁니다. Linear는 `LINEAR_API_KEY` 환경 변수로 GraphQL(`https://api.linear.app/graphql`)을 직접 호출합니다(`issues(filter:{number:{in:[…]}})`). 프로덕션에 **배포된 것만** 넣고, In Review·develop 머지 상태는 다음 회분으로 넘깁니다. QA 이슈(`~차 QA 완료`)는 별도 섹션으로 만들지 않고 해당 기능 섹션의 목록이나 "그 외 변경점"에 흡수합니다.
2. **버전·날짜·범위 확정** — 아래 1·2절로 정한 뒤, 작성 전에 사용자에게 한 번만 확인합니다(버전, 배포일, 포함 이슈).
3. **한국어 원문 작성** — 3·4절대로 `ko/changelog.mdx` **파일 맨 위**(프런트매터 바로 아래)에 새 `<Update>` 블록을 넣습니다. 최신 회분이 위로 갑니다.
4. **영어·일본어 번역** — 5절대로 `changelog.mdx`, `ja/changelog.mdx`에 같은 위치에 넣습니다.
5. **검증** — 6절 체크리스트를 실행하고 결과를 보고합니다. 커밋·PR은 요청이 있을 때만 합니다.

### 1. 버전 표기

`MAJOR.MINOR.PATCH` 시맨틱 버전을 `<Update>`의 `label`에만 적습니다. 제목이나 본문에 버전을 반복하지 않습니다. 예외는 요약 문장의 "이번 X.Y.Z 업데이트에서는" 한 곳입니다.

| 자리  | 올리는 경우                                        | 예           |
| ----- | -------------------------------------------------- | ------------ |
| MAJOR | 요금제·인증·API 계약처럼 고객이 대응해야 하는 변경 | 2.0.0        |
| MINOR | 새 기능, 화면 리뉴얼, 메뉴 구조 변경               | 1.1.0, 1.2.0 |
| PATCH | 버그 수정, 문구·간격 조정, 핫픽스                  | 1.1.1        |

- 이전 서비스를 1.0으로 보고 첫 회분을 1.1.0으로 시작했습니다. 다음 MINOR는 1.2.0입니다.
- `description`에는 작성일이 아니라 **실제 배포일**을 `YYYY-MM-DD`로 적습니다. 여러 배포를 한 회분으로 묶으면 마지막 배포일을 씁니다.
- 패치노트 버전은 "고객이 보는 BIZ MORI" 하나의 버전입니다. API 경로의 `v2`와는 별개이며 따로 관리하지 않습니다.

### 2. 발행 주기

- **격주 발행**이 기본입니다. 2주 동안 쌓인 변경을 한 회분으로 묶습니다.
- 배포일로부터 **영업일 3일 이내**에 발행합니다.
- 고객 대응이 필요한 핫픽스는 주기를 기다리지 않고 PATCH 회분으로 바로 냅니다.
- 변경이 없는 주기는 건너뜁니다. "변경 없음" 회분은 만들지 않습니다.

### 3. 고정 본문 형식

한 회분은 아래 10단계를 이 순서대로 갖습니다. 단계를 빼거나 순서를 바꾸지 않습니다. 각 단계의 문장은 1.1.0과 **같은 문형**을 씁니다.

| #   | 단계          | 한국어 문형 (1.1.0 그대로)                                                                                                        |
| --- | ------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| 1   | 인사말        | `안녕하세요, 팀 BIZ MORI입니다! 🙌`                                                                                               |
| 2   | 한 줄 요약    | `이번 X.Y.Z 업데이트에서는 **(핵심을 한 문장으로)했습니다.**`                                                                     |
| 3   | 부연 한 줄    | `이제 (고객이 얻는 효과)할 수 있습니다.`                                                                                          |
| 4   | `---`         |                                                                                                                                   |
| 5   | 변경 섹션 × N | `### <이모지> <이점 중심 소제목, 해요체>` — 아래 "섹션 내부" 참조                                                                 |
| 6   | 그 외 변경점  | `### ✨ 그 외 변경점` + `- …했습니다.` 목록                                                                                       |
| 7   | `---`         |                                                                                                                                   |
| 8   | 피드백 안내   | `BIZ MORI를 사용하면서 불편한 점이나 개선 의견이 있다면 언제든 [support@bizmori.com](mailto:support@bizmori.com)으로 알려주세요.` |
| 9   | 감사          | `감사합니다.`                                                                                                                     |
| 10  | 서명          | `팀 BIZ MORI 드림`                                                                                                                |

**섹션 내부**는 항상 이 흐름입니다.

1. 전에는 — `지금까지는 …해야 했습니다.` / `기존에는 …있었습니다.` 한 문단
2. 이제는 — `이제 …합니다.` / `이번 업데이트부터는 …됩니다.` 한 문단
3. 사용 방법 — `- **UI 요소**: 설명.` 목록. 개수는 이슈에 있는 사실만큼만(1개여도 됩니다). 화면 이름·버튼 이름은 굵게
4. 제한사항 — 있을 때만 마지막에 한 줄. 값은 인라인 코드(예: `` `-`로 표시됩니다 ``)

각 섹션 뒤에 `---`를 둡니다. 따라서 `---` 개수는 **섹션 수 + 3**입니다(프런트매터 2개 + 인사말 블록 뒤 1개 + 섹션마다 1개). 1.1.0은 섹션 6개(변경 5 + 그 외 1), `---` 9개입니다.

**소제목 톤** — 1.1.0의 실제 소제목입니다. 새 회분도 이 어조로 씁니다.

| 이모지 | ko (해요체)                                        | en (sentence case)                                           | ja (です・ます)                                               |
| ------ | -------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------- |
| 📊     | 홈에서 플랜, 사용량, 작업 상태를 한눈에 확인하세요 | Check your plan, usage, and order status at a glance on home | ホームでプラン、利用量、作業ステータスを一目で確認できます    |
| 📋     | 상단 바를 없애고 메뉴를 왼쪽으로 모았어요          | We removed the top bar and moved the menu to the left        | 上部バーをなくし、メニューを左側にまとめました                |
| 🌄     | 워터마크 삽입과 검출을 별도 페이지로 나눴어요      | We split watermark embed and extract into separate pages     | watermark 埋め込みと watermark 検出を別々のページに分けました |
| 📋     | 처리 내역 테이블이 더 읽기 쉬워졌어요              | The processing history table is easier to read               | 処理履歴テーブルがより見やすくなりました                      |
| 🎬     | 온보딩 안내 페이지를 개선했어요                    | We improved the onboarding page                              | オンボーディング案内ページを改善しました                      |
| ✨     | 그 외 변경점                                       | Other changes                                                | その他の変更点                                                |

**템플릿** — 그대로 복사해 채웁니다.

```mdx
<Update label="1.2.0" description="2026-09-XX">

안녕하세요, 팀 BIZ MORI입니다! 🙌

이번 1.2.0 업데이트에서는 **(핵심 한 문장)했습니다.**

이제 (고객이 얻는 효과)할 수 있습니다.

---

### 📊 (이점 중심 소제목, 해요체)

지금까지는 (이전 동작이나 불편)해야 했습니다.

이제 (바뀐 동작)합니다.

- **(UI 요소)**: (사용 방법).
- **(UI 요소)**: (사용 방법).

(제한사항이 있으면 한 줄)

---

### ✨ 그 외 변경점

- (작은 변경)했습니다.

---

BIZ MORI를 사용하면서 불편한 점이나 개선 의견이 있다면 언제든 [support@bizmori.com](mailto:support@bizmori.com)으로 알려주세요.

감사합니다.

팀 BIZ MORI 드림

</Update>
```

### 4. 작성 규칙

해야 할 것:

- 소제목은 해요체(`~했어요`, `~하세요`, `~졌어요`), 본문은 합니다체(`~합니다`).
- 소제목 앞 이모지 하나. 기능을 상징하는 것으로 고르고, 같은 이모지를 두 섹션에 써도 됩니다(1.1.0의 📋). 참고: 📊 대시보드·통계, 📋 메뉴·테이블, 🌄 이미지·워터마크, 🎬 온보딩·영상, 🔑 API 키, 🔔 웹훅·알림, 💳 결제·크레딧, 🌐 언어·다국어, 🛡️ 보안·Anti-AI. ✨는 "그 외 변경점" 전용입니다.
- UI 요소는 굵게(`**프로필**`, `**분석 보고서 다운로드**`). 대시보드 화면에 실제로 표시되는 이름을 씁니다. 이름은 이슈 본문 → 대시보드 로케일 파일(`mori-biz` 저장소 `src/locales/ko.json`) 순으로 확인하고, 둘 다 없으면 추측하지 말고 사용자에게 묻습니다.
- 대시보드만 바뀌고 API는 그대로면 `이번 변경은 대시보드 화면에만 적용됩니다. API 엔드포인트, 요청·응답 형식, 웹훅 페이로드는 바뀌지 않았으므로 기존 연동 코드를 수정할 필요가 없습니다.`를 해당 섹션 끝에 넣습니다. API가 바뀌면 해당 레퍼런스 페이지로 링크합니다.
- 용어는 아래 표를 따릅니다.

  | ko                     | en                                                                        | ja                        |
  | ---------------------- | ------------------------------------------------------------------------- | ------------------------- |
  | AI 학습 방해 필터      | AI Training Disruption Filter                                             | AI学習妨害フィルター      |
  | AI 생성 이미지 판별    | AI Image Detection                                                        | AI生成画像の判別          |
  | 워터마크 삽입 / 검출   | Watermark Embed / Extract (메뉴명), watermark embed / extract (일반 명사) | watermark 埋め込み / 検出 |
  | Anti-AI                | Anti-AI                                                                   | Anti-AI                   |
  | 주문                   | order                                                                     | 注文                      |
  | API 키                 | API key                                                                   | API キー                  |
  | 웹훅                   | webhook                                                                   | Webhook                   |
  | 크레딧                 | credits                                                                   | クレジット                |
  | 플랜                   | plan                                                                      | プラン                    |
  | 사용 기록              | Usage history                                                             | 利用履歴                  |
  | 구독 관리              | Subscription                                                              | サブスクリプション管理    |
  | 프로필                 | Profile                                                                   | プロフィール              |
  | 고객 문의 / API 가이드 | Contact support / API guide                                               | お問い合わせ / API ガイド |
  | 종류 컬럼              | Type column                                                               | 種類 列                   |

하지 말아야 할 것:

- **이슈에 없는 원인이나 효과를 지어내지 않습니다.** "영상이라 네트워크에 따라 느렸다"처럼 근거 없는 설명은 금지. 이슈에 적힌 사실만 씁니다.
- Linear 이슈 번호, Figma 링크, 소스 파일 경로, 내부 컴포넌트 이름, 담당자 이름을 쓰지 않습니다.
- 스크린샷·이미지·`<Frame>`을 넣지 않습니다.
- 본문에서 제품명·기능명을 코드 스팬으로 감싸지 않습니다. 코드 스팬은 값(`-`)과 문자열 표기에만 씁니다.
- "주문" 대신 "요청"·"작업"을, "API 키" 대신 "토큰"을 쓰지 않습니다.

### 5. 언어와 파일

| 언어          | 파일               | title        | 인사말                                | 마무리                                       |
| ------------- | ------------------ | ------------ | ------------------------------------- | -------------------------------------------- |
| 한국어 (원문) | `ko/changelog.mdx` | 패치노트     | `안녕하세요, 팀 BIZ MORI입니다! 🙌`   | `감사합니다.` / `팀 BIZ MORI 드림`           |
| 영어          | `changelog.mdx`    | What's new   | `Hello from Team BIZ MORI! 🙌`        | `Thank you.` / `Team BIZ MORI`               |
| 일본어        | `ja/changelog.mdx` | パッチノート | `こんにちは、BIZ MORI チームです！🙌` | `ありがとうございます。` / `BIZ MORI チーム` |

- **한국어를 먼저 확정**한 뒤 영어·일본어로 옮깁니다. 세 파일은 섹션 수, `---` 개수, 이모지 종류와 위치, 목록 항목 수, 표 행 수가 같아야 합니다. 문장을 더하거나 빼지 않습니다.
- 영어 요약: `In this X.Y.Z update, we **…**` / 부연: `You can now …`. 2인칭, 능동태, 소제목은 sentence case. 피드백 문장: `If you run into any inconvenience or have suggestions for improvement while using BIZ MORI, let us know anytime at [support@bizmori.com](mailto:support@bizmori.com).`
- 일본어 요약: `今回の X.Y.Z アップデートでは **…しました。**` / 부연: `これで、…できます。`. です・ます체. 피드백 문장: `BIZ MORI をご利用いただく中で、不便な点や改善のご意見がございましたら、いつでも [support@bizmori.com](mailto:support@bizmori.com) までお知らせください。`
- 일본어는 `watermark`를 영문으로 쓰고 앞뒤 가나·한자와 반각 공백을 둡니다(`watermark の埋め込み`). `ウォーターマーク`는 쓰지 않습니다. 굵은 영문 앞뒤에도 반각 공백을 둡니다(`を **BIZ MORI** に`, `に **watermark 埋め込み** と`).
- 용어 통일 표를 넣을 때 표 아래 괄호 문장은 **나머지 두 언어의 문자열**을 코드 스팬으로 나열합니다(ko 파일은 en·ja, en 파일은 ko·ja, ja 파일은 en·ko).
- URL과 파일명은 바꾸지 않습니다. `docs.json`은 이미 등록되어 있어 회분 추가 시 손댈 필요가 없습니다.

### 6. 발행 체크리스트

```bash
# 세 언어 구조 일치 — 세 줄의 숫자가 모두 같아야 합니다
for f in ko/changelog.mdx changelog.mdx ja/changelog.mdx; do
  printf "%-18s sections=%s rules=%s updates=%s\n" "$f" \
    "$(grep -c '^### ' "$f")" "$(grep -c '^---$' "$f")" "$(grep -c '<Update ' "$f")"
done
grep -c 'ウォーターマーク' ja/changelog.mdx                                   # 0
grep -nE 'SERVICE-[0-9]+|figma\.com|\.tsx|src/' changelog.mdx ko/changelog.mdx ja/changelog.mdx   # 없음
mint validate && mint broken-links
```

- [ ] `label`이 버전, `description`이 실제 배포일
- [ ] 새 회분이 세 파일 모두 맨 위에 있고 `rules` = `sections` + 3
- [ ] 위 명령 모두 통과
- [ ] `main` 머지 후 `https://docs.bizmori.com/changelog`에서 세 언어 확인
