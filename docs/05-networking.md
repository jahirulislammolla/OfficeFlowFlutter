# Step 5 — API ও Networking

## Official documentation পড়ুন

- Network data fetching: https://docs.flutter.dev/data-and-backend/networking
- JSON serialization: https://docs.flutter.dev/data-and-backend/json
- HTTP package: https://pub.dev/packages/http
- Dio package: https://pub.dev/packages/dio

## API strategy

শুরুর API:

- DummyJSON login: https://dummyjson.com/docs/auth
- DummyJSON users/products: https://dummyjson.com/docs
- JSONPlaceholder: https://jsonplaceholder.typicode.com/
- Open-Meteo: https://open-meteo.com/en/docs

শুরুতে `http` package দিয়েই Repository/Service pattern শেখা সহজ। পরে Dio optional।

## App structure

```text
features/employees/
  data/
    employee_remote_data_source.dart
    employee_repository_impl.dart
  domain/
    employee.dart
    employee_repository.dart
  presentation/
    employee_list_page.dart
```

## Error handling

এরকম states রাখুন:

- Initial
- Loading
- Success
- Empty
- Error
- Pagination loading

Network error-এর জন্য message:

- No internet
- Timeout
- Unauthorized
- Server unavailable
- Unexpected error

মডেল বানানোর নিয়ম:

- API response থেকে `fromJson`
- UI-তে raw `Map<String, dynamic>` না পাঠানো
- Unknown/null field safely handle

## Project tasks

1. Login API response থেকে token/user model map।
2. Employees/users endpoint থেকে list load।
3. Search query API বা local list দিয়ে filter।
4. Employee detail page fetch।
5. Open-Meteo দিয়ে office weather card।

## আপনার পরীক্ষা

- Flight/offline মোডে app crash না করে।
- Timeout শেষে loading state থামে।
- Wrong login response error দেখায়।
- 204/no body কিংবা empty array safely handle হয়।
