# Step 6 — Local Storage ও Offline Cache

## Official documentation দেখুন

- Persistence overview: https://docs.flutter.dev/cookbook/persistence
- `shared_preferences`: https://pub.dev/packages/shared_preferences
- Hive CE/Isar/SQFlite options: project এর complexity অনুযায়ী চয়ন

## শুরুতে কোথায় কী রাখবেন

### shared_preferences

- Theme preference
- Login flag
- Language preference
- Last search query

### Secure storage

- Learning prototype token চাইলে `flutter_secure_storage`
- Android/iOS secure keystore ব্যবহার করতে হয়
- Web-এ secure storage-এর সীমাবদ্ধতা বুঝতে হবে
- Demo token production credential নয়

### Database

শুরুর কাছে offline attendance cache-এর জন্য SQLite/Sqflite শেখা ভালো:

- attendance record list
- offline check-in/check-out queue
- pending sync status

## Project tasks

1. Login করে user preference save।
2. Restart করে login session restore।
3. Theme switch save।
4. Last fetched employees cache।
5. Attendance check-in local DB-তে save।
6. Internet আসলে pending attendance sync।

## আপনার পরীক্ষা

- Cache expire বা corrupted হলে fallback।
- Storage key typo handling আছে।
- Logout করলে user-specific cache/credential clear হয়।
- Offline check-in/UI-data inconsistent না হয়।
