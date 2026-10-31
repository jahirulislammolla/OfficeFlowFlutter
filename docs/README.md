# Flutter শেখার অফিস-সদৃশ Learning Plan

## উদ্দেশ্য

এই শেখার পরিকল্পনায় একটিই Flutter project থেকে শুরু থেকে production-style application তৈরি করা হবে। প্রতিটি ধাপে Official Flutter documentation-এর মূল flow অনুসরণ করা হবে এবং প্রতিটি শেখা topic একই project-এ apply করা হবে।

**প্রজেক্টের নাম:** `workspace_flutter`

**প্রজেক্টের লক্ষ্য:** Team, project, task এবং attendance সম্পর্কিত একটি office-style application তৈরি করা।

## কীভাবে এই পরিকল্পনা ব্যবহার করবেন

প্রতিটি step-এর জন্য একই workflow অনুসরণ করুন:

1. প্রথমে [docs/curriculum.md](curriculum.md)-এ বর্তমান পর্বটি পড়ুন।
2. Official Flutter documentation-এর নির্ধারিত নথিগুলো পড়ুন।
3. project-এ নিজে কোড লিখুন। আগে দেখে copy করলে learning কম হবে।
4. ছোট ছোট commit/backup রাখুন।
5. পরের step-এর আগে “নিজের পরীক্ষা” সব pass করান।
6. AI ব্যবহার করে solution দেখুন, শুধু নিজে চেষ্টা করে বন্ধনের পর।

## আধুনিক Flutter শেখার নিয়ম

- Flutter `Material 3` ব্যবহার করুন।
- Stateless ও Stateful widget-এর আসল প্রয়োজন বুঝে ব্যবহার করুন।
- Widget-কে ছোট ও reusable রাখুন।
- UI থেকে data fetching logic আলাদা রাখুন।
- Null safety সর্বত্র ব্যবহার করুন।
- Free/open API-এর response model স্পষ্টভাবে map করুন।
- State management beginner level থেকে ধীরে ধীরে প্রবর্তন করুন।
- Dark theme, responsive layout এবং accessibility পরের অংশে যোগ করুন।

## মূল Project Structure

```text
lib/
  app/
  core/
    constants/
    errors/
    network/
    routing/
    theme/
  features/
    auth/
    dashboard/
    employees/
    attendance/
    projects/
    tasks/
    profile/
  shared/
    widgets/
    utils/
test/
integration_test/
docs/
```

## নির্ধারিত Free/Open API

শুরুর API হিসেবে এগুলো ব্যবহার করা হবে:

| API | ব্যবহার | Type |
|---|---|---|
| DummyJSON | Login, user, search, product/expense sample | Public free REST API |
| JSONPlaceholder | Posts/comments/users sample CRUD | Public mock REST API |
| Open-Meteo | Weather/office location data | Free REST API, API key লাগে না |
| REST Countries | Country ও timezone sample | Free REST API, API key লাগে না |

**গুরুত্বপূর্ণ:** DummyJSON-এর login token prototype/learning-এর জন্য। Production app-এ bank, payment বা confidential credential ব্যবহার করবেন না।

## সম্পূর্ণ পাঠ্যক্রম

বিষয়ভিত্তিক files:

- [01-setup.md](01-setup.md)
- [02-dart-basics.md](02-dart-basics.md)
- [03-layout.md](03-layout.md)
- [04-navigation.md](04-navigation.md)
- [05-networking.md](05-networking.md)
- [06-storage.md](06-storage.md)
- [07-state-management.md](07-state-management.md)
- [08-testing.md](08-testing.md)
- [09-polish.md](09-polish.md)
- [10-capstone.md](10-capstone.md)

## প্রতিটি অফিস flow-এর ফল

1. Install Flutter ও setup করা।
2. Dart language পারা।
3. Login পরের dashboard দেখা।
4. Employees list ও detail দেখা।
5. Projects ও tasks list/filter করা।
6. Attendance check-in/check-out করা।
7. API data cache ও offline fallback রাখা।
8. Dark/light theme, responsive UI ও accessibility করা।
9. Widget, unit এবং integration test লেখা।
10. Android/APK বা web build তৈরি করা।
