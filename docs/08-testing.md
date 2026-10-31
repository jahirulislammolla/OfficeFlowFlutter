# Step 8 — Testing ও Debugging

## Official documentation পড়ুন

- Testing overview: https://docs.flutter.dev/testing
- Unit test: https://docs.flutter.dev/cookbook/testing/unit/introduction
- Widget test: https://docs.flutter.dev/cookbook/testing/widget/introduction
- Integration test: https://docs.flutter.dev/testing/integration-tests

## Test layers

### Unit

- JSON parsing
- Repository success/error
- attendance validation
- date calculations
- search/sort logic

### Widget

- Login validation
- Employee card
- loading/error/empty states
- theme switch

### Integration

- Login → Dashboard
- Search employee → Detail
- Check-in → Attendance saved
- Logout → Login screen

## Command

```powershell
flutter test
flutter test integration_test/app_test.dart
flutter analyze
```

## Debugging শেখা

- DevTools: https://docs.flutter.dev/tools/devtools
- Hot reload/restart
- `debugPrint`
- breakpoint ও step through
- Widget Inspector
- Performance view

প্রতিটি production bug fix-এর জন্য একটি regression test লেখা সবচেয়ে ভাল practice।

## আপনার পরীক্ষা

- Important repository test pass করে।
- Main login flow integration test pass করে।
- Analyzeে warning থাকলেও কারণে conscious decision আছে।
