# Step 2 — Dart Language Basics

## Official documentation পড়ুন

- Dart language overview: https://dart.dev/guides/language
- null safety: https://dart.dev/null-safety
- asynchronous programming: https://dart.dev/libraries/dart-async

## শেখার order

1. `var`, `final`, `const`
2. `int`, `double`, `String`, `bool`
3. `List`, `Map`, records ও collections
4. `if`, loops এবং switch
5. function, optional parameter, named parameter
6. class, constructor, getters, inheritance
7. mixin এবং extension-এর basic ধারণা
8. `null`, `?`, `!`, `late`
9. `Future`, `async`, `await`
10. streams-এর basic ধারণা

## Project task

`core/models` ফোল্ডারে প্রথমে এই models বানান:

- `Employee`
- `Project`
- `TaskItem`
- `AttendanceRecord`

প্রথম version JSON না পড়ে আগে static constructor values ব্যবহার করুন।

উদাহরণ concept:

```dart
class Employee {
  final String id;
  final String name;
  final String designation;

  const Employee({
    required this.id,
    required this.name,
    required this.designation,
  });
}
```

## আপনার পরীক্ষা

- null safety ছাড়া `!` না লিখে code compile হয়?
- immutable model এ `final` ব্যবহার হয়েছে?
- list/map থেকে filter ও sorting করা হয়েছে?
- `Future` এর success/error দুইটি case আছে?
