# Step 1 — Windows, VS Code ও প্রথম Web Project

## Official documentation পড়ুন

- Install Flutter: https://docs.flutter.dev/get-started/install
- Flutter editor setup: https://docs.flutter.dev/get-started/editor
- Test first app: https://docs.flutter.dev/get-started/test-drive

## দেখবেন/করবেন

### আপনার প্রথম target: Chrome web

শুরুর ২–৩ সপ্তাহ শুধু **VS Code + Chrome** ব্যবহার করুন। এতে Android SDK বা emulator setup-এর জটিলতা ছাড়াই Flutter, Dart ও UI শেখায় মনোযোগ দিতে পারবেন। পরে Android emulator বা ফোনে test যোগ করবেন।

### Windows setup

1. Git for Windows install করুন।
2. VS Code install করুন।
3. VS Code Extensions থেকে `Flutter` install করুন। এর সঙ্গে `Dart` extension-ও install হবে।
4. VS Code Command Palette (`Ctrl + Shift + P`) থেকে `Flutter: New Project` চালিয়ে Flutter SDK download/locate করুন। SDK-এর `bin` path `Path`-এ আছে কি না নিশ্চিত করুন।
5. Chrome install/update রাখুন। এটি প্রথম Flutter web test device হবে।

`flutter doctor -v` চালান। শুরুতে Flutter ও Chrome-এর check ঠিক থাকলেই কাজ শুরু করা যাবে। Android Studio/Android SDK সংক্রান্ত warning পরে mobile target করার সময় ঠিক করবেন।

### Project তৈরি

```powershell
flutter create workspace_flutter
cd workspace_flutter
flutter run -d chrome
```

VS Code-এ status bar থেকে `Chrome` device select করুন এবং `F5` চাপলে debug run হবে।

### প্রথম পরিবর্তন

Counter app সরিয়ে `MaterialApp` এবং `Scaffold` দিয়ে একটি temporary home page করুন।

## Android test কখন করবেন

Week 4–5-এর মধ্যে, অথবা প্রথম API feature শেষ হওয়ার পর Android Studio install করে Android SDK ও emulator setup করুন। সম্ভব হলে নিজের Android ফোনেও USB debugging দিয়ে test করুন।

Final submission-এর আগে Chrome এবং অন্তত একটি Android device/emulator-এ app test করবেন। Windows desktop `.exe` build এখন দরকার নেই; ভবিষ্যতে দরকার হলে আলাদা করে Visual Studio Community-এর Desktop development with C++ workload লাগবে।

## আপনার পরীক্ষা

- App Chrome-এ রান করেছে?
- Hot reload কাজ করেছে?
- `flutter analyze` কোনো fatal error দেয়নি?
- Git/backup চালু আছে?

## মনে রাখার বিষয়

- `main()` app শুরু করে।
- `runApp()` widget tree চালু করে।
- `MaterialApp` theme ও navigation foundation দেয়।
- `Scaffold` সাধারণ page structure দেয়।
