# Step 4 — Routing, Login ও Forms

## Official documentation পড়ুন

- Navigation: https://docs.flutter.dev/ui/navigation
- Forms validation: https://docs.flutter.dev/ui/forms
- Deep linking: https://docs.flutter.dev/ui/navigation/deep-linking

## Screens

- Splash
- Login
- Dashboard
- Employees
- Employee detail
- Projects
- Project detail
- Tasks
- Profile
- Attendance

## শুরুর routing method

দুই step রাখতে পারেন:

1. প্রথমে `Navigator` দিয়ে শেখা।
2. পরে `go_router` package দিয়ে named routes ও redirect শেখা।

Feature growth হলে route guard:

- না-login হলে `/login`
- login হলে protected dashboard routes
- unknown route হলে not-found screen

## Form validation

Login fields:

- Email: ফাঁকা নয়; valid email format
- Password: কমপক্ষে ৮ character

`TextEditingController` পরে অথবা login state state-manager ও dispose করার মাধ্যমে নিয়ন্ত্রণ করুন।

## আপনার পরীক্ষা

- Back button expected previous screen দেয়।
- Invalid form submit করলে message দেখায়।
- Loading হলে button disable আছে।
- Logout করলে protected route না খোলে।
