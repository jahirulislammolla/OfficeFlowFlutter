# Step 10 — Capstone ও Final Submission

## Final feature list

### Auth

- Login validation
- Logout
- Secure token/session handling
- API failure handling

### Dashboard

- Employee count
- Open task count
- Attendance summary
- Office weather

### Employees

- Search
- Pagination
- Employee details
- Profile edit

### Projects এবং Tasks

- Project list/detail
- Task status filter
- Assignee view
- Create/edit task locally or API-supported mock endpoint

### Attendance

- Check-in/check-out
- Date history
- Offline save
- Pending sync status

### Settings

- Light/dark theme
- English/Bangla
- Logout
- Cache clear

## Architecture acceptance criteria

- UI widgets business logic থেকে পৃথক।
- Repository interface/data source separation আছে।
- App secrets source code-এ নেই।
- API model-এর null safety আছে।
- Navigation route centralized।
- Loading/empty/error states আছে।
- Unit/widget/integration tests আছে।
- Responsive mobile/tablet/web UI আছে।

## Build commands

```powershell
flutter analyze
flutter test
flutter build apk --release
flutter build web --release
```

Web build হলে ব্যস্ত page size/performance inspect করতে DevTools ব্যবহার করুন।

## Demo শেখানোর structure

1. ২ মিনিট project উদ্দেশ্য।
2. ২ মিনিট login/dashboard।
3. ৩ মিনিট employees/project/task/attendance।
4. ২ মিনিট offline/theme/localization।
5. ২ মিনিট architecture ও test।
6. ১ মিনিট ভবিষ্যৎ roadmap।

## এই পর্যায়ের পরের दिशा

- Firebase/Supabase official backend
- Push notification
- Background sync
- CI/CD
- Clean Architecture deeper
- Bloc/Cubit/Riverpod specialization
