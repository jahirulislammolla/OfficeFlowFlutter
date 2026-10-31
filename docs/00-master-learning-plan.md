# Flutter শেখা ও OfficeFlow Project Master Plan

## এই document কীভাবে ব্যবহার করবেন

আপনি একটি project বানাতে বানাতে Flutter শিখবেন। Project-এর নাম **OfficeFlow**: একটি demo office-management app, যেখানে login, employee, task, attendance ও weather থাকবে। প্রথম ২–৩ সপ্তাহ Windows-এ **VS Code + Chrome** দিয়ে web target-এ কাজ করবেন; এরপর Android emulator বা ফোনে mobile test যোগ করবেন।

একটি phase শেষ না করে পরের phase-এ যাবেন না। প্রতিদিন 60–90 মিনিট দিলেই যথেষ্ট:

1. 15 মিনিট — official document পড়ুন।
2. 45–60 মিনিট — নিজে code লিখুন ও feature বানান।
3. 10 মিনিট — test/checklist ও আজকের note লিখুন।
4. কাজ শেষে ছোট, অর্থপূর্ণ Git commit দিন। উদাহরণ: `feat(auth): add login validation`.

প্রথমে এই document-এর phase অনুসরণ করুন; এরপর সংশ্লিষ্ট বিস্তারিত file পড়ুন।

## Project scope

### Must-have features

- Demo login ও logout
- Dashboard: employee, open task, attendance ও weather summary
- Employee list, search ও detail page
- Project/task list, status filter ও local task create/edit
- Attendance check-in/check-out এবং offline pending status
- Light/dark theme, Bangla/English UI, responsive layout
- Loading, empty ও error state

### Learning rule

- একসঙ্গে একটির বেশি state-management library ব্যবহার করবেন না। শুরুতে `Provider` + `ChangeNotifier` নিন।
- API response UI-তে সরাসরি `Map<String, dynamic>` হিসেবে পাঠাবেন না; model ও repository ব্যবহার করুন।
- Public demo API-এর token/data কেবল learning-এর জন্য। আসল password, employee data বা secret commit করবেন না।

## Free API plan

| কাজ | API | কী শিখবেন | সতর্কতা |
|---|---|---|---|
| Demo login, users, todos | [DummyJSON](https://dummyjson.com/docs) | POST, token, pagination, search | Demo credential/token মাত্র |
| Task/post CRUD prototype | [JSONPlaceholder](https://jsonplaceholder.typicode.com/) | GET/POST/PATCH/DELETE request | পরিবর্তন server-এ স্থায়ী হয় না |
| Office weather | [Open-Meteo](https://open-meteo.com/en/docs) | query parameter, JSON parsing, error state | location coordinate আলাদা constant-এ রাখুন |

এই তিনটি API-তে শুরু করার জন্য API key লাগে না। REST Countries বর্তমান পরিকল্পনায় রাখবেন না—তার বর্তমান API flow key-based; পরে প্রয়োজন হলে তার terms দেখে যুক্ত করবেন।

## 12-week step-by-step roadmap

| সপ্তাহ | শিখবেন | OfficeFlow-তে deliverable | Done হলে প্রমাণ |
|---|---|---|---|
| 1 | Setup, Dart basics | Chrome-এ app run, static `Employee`, `TaskItem` model | `flutter doctor -v`, `flutter analyze` clean |
| 2 | Widget, layout, Material 3 | Static dashboard ও reusable summary card | Mobile width-এ overflow নেই |
| 3 | Navigation, form | Splash → Login → Dashboard, validation | Invalid login submit-এ error দেখায় |
| 4 | HTTP, JSON, async | DummyJSON user/employee list ও detail | loading/error/empty state আছে |
| 5 | Repository, model, pagination | Search + pagination, weather card | UI-তে raw JSON নেই |
| 6 | Provider state management | Auth, employee, dashboard controller | refresh-এ correct UI rebuild |
| 7 | Local storage/offline | Theme/session, attendance local queue | restart-এর পর preference থাকে |
| 8 | Task module | JSONPlaceholder task list, filter, local create/edit | status filter ও detail কাজ করে |
| 9 | Responsive UI, localization | NavigationRail/tablet layout, বাংলা/English, dark mode | 200% text scale readable |
| 10 | Testing/debugging | model, repository, login widget tests | `flutter test` pass |
| 11 | Polish/accessibility | semantics, retry, pagination, empty/error UI | keyboard/screen-reader basics checked |
| 12 | Release & review | APK/web build, demo, README | analyze, test ও build pass |

## প্রতিটি task-এর office workflow

প্রতিটি ছোট feature একই flow-তে করবেন। এতে একা শিখলেও professional habit তৈরি হবে, আর team lead হিসেবেও progress বোঝা যাবে।

```text
Requirement → ছোট task → UI/API design → Implement → Self-test
            → Pull Request/Review → Test → Demo → Done
```

### Task card template

প্রতি কাজ GitHub Issue, Trello বা একটি Markdown note-এ এভাবে লিখুন:

```text
Title: Employee search
Goal: নাম দিয়ে employee list filter করা
Acceptance criteria:
- 300 ms debounce-এর পরে search হবে
- loading, empty ও error state থাকবে
- clear button দিলে full list দেখাবে
Test evidence: widget test / 30-sec screen recording
Status: Todo | In progress | In review | Done
```

### Definition of Done

কোনো কাজ `Done` হবে শুধু যখন:

- requirement-এর সব acceptance criteria পূরণ হয়েছে;
- mobile screen-এ manually পরীক্ষা করা হয়েছে;
- loading, empty, error case দেখা হয়েছে;
- `flutter analyze`-এ নতুন issue নেই;
- প্রয়োজন হলে test লেখা ও pass হয়েছে;
- ছোট পরিষ্কার commit এবং কী বদলেছে তার note আছে।

## Suggested folder structure

```text
lib/
  app/                 # app, routes, providers
  core/                # network, errors, theme, constants
  features/
    auth/
    dashboard/
    employees/
    tasks/
    attendance/
  shared/widgets/
test/
integration_test/
docs/
```

প্রতিটি feature-এর ভেতরে ধীরে ধীরে `data`, `domain`, `presentation` ভাগ করুন। একদিনে full clean architecture করার দরকার নেই—feature বাড়ার সঙ্গে structure উন্নত করুন।

## Team lead-এর weekly review checklist

প্রতি সপ্তাহে 20–30 মিনিটে এই প্রশ্নগুলোর উত্তর নিন:

- এই সপ্তাহের planned task ও completed task কোনগুলো?
- App-এ live demo দিয়ে featureটি দেখাতে পারছে?
- কী blocker আছে এবং কার সাহায্য লাগবে?
- কোনো bug, shortcut বা technical debt রাখা হয়েছে কি? থাকলে next task আছে কি?
- PR/commit-এ ছোট scope ও clear message আছে কি?
- API failure, empty data ও slow loading test করা হয়েছে কি?
- আগামী সপ্তাহের একমাত্র সবচেয়ে গুরুত্বপূর্ণ deliverable কী?

### সহজ status report

```text
Week: 4
Done: Employee list + loading/error UI
In progress: Employee detail
Blocked: None
Evidence: PR link / commit hash / 30-sec demo
Next: Add search and pagination
```

## Existing docs-এর সঙ্গে map

| এই plan | বিস্তারিত পড়বেন |
|---|---|
| সপ্তাহ 1 | [01-setup.md](01-setup.md), [02-dart-basics.md](02-dart-basics.md) |
| সপ্তাহ 2 | [03-layout.md](03-layout.md) |
| সপ্তাহ 3 | [04-navigation.md](04-navigation.md) |
| সপ্তাহ 4–5 | [05-networking.md](05-networking.md) |
| সপ্তাহ 6 | [07-state-management.md](07-state-management.md) |
| সপ্তাহ 7 | [06-storage.md](06-storage.md) |
| সপ্তাহ 8 | `tasks/` feature-এ একই pattern প্রয়োগ করুন |
| সপ্তাহ 9 ও 11 | [09-polish.md](09-polish.md) |
| সপ্তাহ 10 | [08-testing.md](08-testing.md) |
| সপ্তাহ 12 | [10-capstone.md](10-capstone.md) |

## আজকের প্রথম কাজ

1. [01-setup.md](01-setup.md) শেষ করে `flutter doctor -v` চালান।
2. VS Code-এ project খুলে Chrome target-এ `flutter run -d chrome` চালান।
3. Counter screen সরিয়ে শুধু `OfficeFlow` title-সহ একটি `Scaffold` দেখান।
4. `git init`/remote backup থাকলে প্রথম commit দিন।
5. তারপর Week 1-এর static model task শুরু করুন।
