import '../lib/core/models/employee.dart';

Future<void> main() async {
  print('====================================================');
  print('   STEP 2: DART BASICS CHECKLIST DEMO');
  print('====================================================\n');

  // Sample data: Employee model with immutable `final` fields
  final employees = [
    const Employee(
      id: '1',
      name: 'Rahim',
      designation: 'Developer',
      email: 'rahim@company.com',
    ),
    const Employee(
      id: '2',
      name: 'Karim',
      designation: 'Designer',
      // email is null (to test null safety)
    ),
    const Employee(
      id: '3',
      name: 'Ayesha',
      designation: 'Developer',
      email: 'ayesha@company.com',
    ),
    const Employee(
      id: '4',
      name: 'Tanvir',
      designation: 'Project Manager',
      // email is null
    ),
  ];

  // -----------------------------------------------------------
  // 1. NULL SAFETY: '!' ছাড়া safe code compile এবং run করা
  // -----------------------------------------------------------
  print('--- 1. Null Safety (Without `!`) ---');

  for (final emp in employees) {
    // ❌ ঝুঁকিপূর্ণ উপায় (null হলে runtime crash করবে):
    // String badEmail = emp.email!; 
    print(emp);

    // ✅ উপায় ১: Null-aware operator (?.) এবং Null-coalescing operator (??)
    final safeEmail = emp.email?.toLowerCase() ?? 'No email provided';
    print('${emp.name}: $safeEmail');

    // ✅ উপায় ২: Type Promotion দিয়ে '!' ছাড়াই compile হয়
    final email = emp.email;
    if (email != null) {
      // Dart compiler নিজে থেকেই জানে 'email' এখন non-nullable String!
      // তাই কোনো '!' ছাড়াই .toUpperCase() কল করা যায়:
      print('   -> Verified email: ${email.toUpperCase()}');
    }
  }

  // -----------------------------------------------------------
  // 2. IMMUTABLE MODEL: `final` এর ব্যবহার
  // -----------------------------------------------------------
  print('\n--- 2. Immutable Model with `final` ---');

  final emp = employees[0];
  print('Original Employee: $emp');

  // ❌ Compile-time Error হবে যদি সরাসরি পরিবর্তন করতে চান:
  // emp.name = 'New Rahim'; // Error: The setter 'name' isn't defined!

  // ✅ Immutability বজায় রেখে পরিবর্তন করার নিয়ম হলো `copyWith`:
  final updatedEmp = emp.copyWith(designation: 'Lead Developer');
  print('Original is still: $emp'); // Original অপরিবর্তিত থাকে
  print('Copy & Updated: $updatedEmp'); // Original updated

  // -----------------------------------------------------------
  // 3. LIST & MAP: Filter ও Sorting
  // -----------------------------------------------------------
  print('\n--- 3. List & Map: Filter and Sorting ---');

  // (A) List Filtering: শুধুমাত্র Developers ফিল্টার করা
  final developers = employees
      .where((employee) => employee.designation == 'Developer')
      .toList();
  print('Filtered Developers count: ${developers.length}');

  // (B) List Sorting: নামের ভিত্তিতে Ascending ও Descending সাজানো
  // Ascending sort (A -> Z)
  developers.sort((a, b) => a.name.compareTo(b.name));
  print('Sorted Developers (Ascending A-Z):');
  for (final dev in developers) {
    print('   - ${dev.name} (${dev.designation})');
  }

  // Descending sort (Z -> A)
  developers.sort((a, b) => b.name.compareTo(a.name));
  print('Sorted Developers (Descending Z-A):');
  for (final dev in developers) {
    print('   - ${dev.name}');
  }

  // (C) Map: List থেকে Map তৈরি করা (id -> Employee)
  final Map<String, Employee> employeeMap = {
    for (final e in employees) e.id: e,
  };
  print('\nEmployee Map keys: ${employeeMap.keys.toList()}');

  // Map Filter: শুধু যাদের email আছে তাদের filter করা
  final mapWithEmail = Map.fromEntries(
    employeeMap.entries.where((entry) => entry.value.email != null),
  );
  print('Employees with email (from Map): ${mapWithEmail.keys.toList()}');

  // Map থেকে Safe Lookup (returns nullable `Employee?`):
  final found = employeeMap['999']; // নেই, তাই null আসবে
  print('Search id 999: ${found?.name ?? "Not Found"} (Safe, no ! needed)');

  // -----------------------------------------------------------
  // 4. FUTURE: Success & Error দুইটি case হ্যান্ডলিং
  // -----------------------------------------------------------
  print('\n--- 4. Future: Success & Error Handling ---');

  // টেস্ট ১: Success Case
  print('Fetching valid employee (id: 1)...');
  try {
    final result = await fetchEmployeeById('1', employees);
    print('✅ [Success Case]: Found ${result.name} (${result.designation})');
  } catch (error) {
    print('❌ [Error Case]: $error');
  }

  // টেস্ট ২: Error Case (id: 999 নেই)
  print('\nFetching invalid employee (id: 999)...');
  try {
    final result = await fetchEmployeeById('999', employees);
    print('✅ [Success Case]: Found ${result.name}');
  } catch (error) {
    print('❌ [Error Case Caught]: $error');
  }

  // বোনাস: .then() এবং .catchError() দিয়েও একই কাজ করা যায়:
  print('\nAlternative: using .then() and .catchError():');
  await fetchEmployeeById('999', employees)
      .then((res) => print('✅ Success: ${res.name}'))
      .catchError((err) => print('❌ Caught with .catchError(): $err'));

  print('\n====================================================');
  print('   ALL 4 TESTS EXECUTED SUCCESSFULLY!');
  print('====================================================');
}

/// Simulated Async API call returning a `Future<Employee>`
Future<Employee> fetchEmployeeById(
  String id,
  List<Employee> employeeList,
) async {
  // Network latency simulation (300ms)
  await Future.delayed(const Duration(milliseconds: 300));

  for (final emp in employeeList) {
    if (emp.id == id) {
      return emp; // Success Case
    }
  }

  // Error Case: অবজেক্ট না পেলে exception throw করা হয়
  throw Exception('Employee with ID "$id" does not exist in the database.');
}
