# Step 7 — State Management

## Official documentation পড়ুন

- State management intro: https://docs.flutter.dev/data-and-backend/state-mgmt
- Provider: https://docs.flutter.dev/data-and-backend/state-mgmt/simple
- Riverpod: https://riverpod.dev/docs/introduction/getting_started

## Beginner recommendation

শুরুতে `ChangeNotifier` + `Provider`। এতে:

- UI rebuild
- loading/error
- list update
- dependency injection

বোঝা হলে `Riverpod` বা `Bloc`-এ migrate করতে পারেন। একযোগে তিনটি state package শেখার দরকার নেই।

## Example controller duties

একটি `EmployeeController`-এর কাছে:

- search text
- loading flag
- employee list
- selected employee
- error message

API call/DB call controller-এর data layer repo থেকে করাতে হবে। Controller UI থেকে HTTP body/`Map` handle করবে না।

## Office state pattern

- AuthController
- ThemeController
- AttendanceController
- TaskController
- EmployeeListController
- DashboardController

## আপনার পরীক্ষা

- Controller dispose বা ref lifecycle সহজ।
- একই data বারবার fetch না হয়।
- API response change হলে UI rebuild হয়।
- Loading state stale data ঢেকে রাখে কি না।
