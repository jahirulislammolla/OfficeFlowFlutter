import '../lib/core/models/employee.dart';

// =====================================================================
// STEP 2: REMAINING DART CONCEPTS PRACTICE (Topics 3, 4, 5, 6, 7, 8, 10)
// =====================================================================

Future<void> main() async {
  print('====================================================');
  print('   STEP 2: ADVANCED DART CONCEPTS (PRACTICE 3)');
  print('====================================================\n');

  // -------------------------------------------------------------------
  // [Topic 3] RECORDS, SET, COLLECTION IF/FOR & SPREAD OPERATOR
  // -------------------------------------------------------------------
  print('--- [Topic 3] Records & Modern Collections ---');

  // 1. Records (Dart 3 feature: multiple return values from a function)
  final (deptName, empCount, avgSalary: avgSal) = getDepartmentStats();
  print('Record Destructured: Dept = $deptName, Count = $empCount, Avg Salary = \$$avgSal');

  // 2. Set (Unique elements, no duplicates)
  final departments = {'IT', 'HR', 'IT', 'Finance', 'HR'};
  print('Unique Set: $departments'); // Duplicate 'IT' and 'HR' are automatically removed

  // 3. Collection-if, Collection-for, and Spread operator (...)
  final baseSkills = ['Git', 'Flutter'];
  final isSenior = true;

  final fullSkills = [
    ...baseSkills, // Spread operator: unpacks baseSkills list
    if (isSenior) 'System Architecture', // Collection if
    for (var i = 1; i <= 2; i++) 'Cloud Level $i', // Collection for
  ];
  print('Skills (with ..., if, for): $fullSkills\n');

  // -------------------------------------------------------------------
  // [Topic 4] SWITCH EXPRESSION (Dart 3) & LOOPS
  // -------------------------------------------------------------------
  print('--- [Topic 4] Modern Switch Expression ---');

  final roles = ['Developer', 'Designer', 'Manager', 'Intern'];
  for (final role in roles) {
    // Switch Expression: returns a value directly and cleanly
    final responsibility = switch (role) {
      'Developer' => 'Writes application code & unit tests',
      'Designer' => 'Creates UI/UX wireframes and prototypes',
      'Manager' => 'Coordinates team and project deadlines',
      _ => 'General onboarding and support tasks',
    };
    print('$role: $responsibility');
  }
  print('');

  // -------------------------------------------------------------------
  // [Topic 5] FUNCTION: Named, Optional, Default & Arrow Syntax
  // -------------------------------------------------------------------
  print('--- [Topic 5] Functions (Named, Defaults, Optional) ---');

  // Calling function with named parameters and default values
  createProject(title: 'OfficeFlow Mobile'); // uses default priority: 'Medium'
  createProject(title: 'Payment Gateway', priority: 'High', isPrivate: true);

  // Calling function with optional positional parameter [title]
  print(formatFullName('Jahir', 'Islam'));
  print(formatFullName('Jahir', 'Islam', 'Mr.'));
  print('');

  // -------------------------------------------------------------------
  // [Topic 6] CLASS, GETTERS, INHERITANCE (extends, super)
  // -------------------------------------------------------------------
  print('--- [Topic 6] Inheritance, Abstract Class & Getters ---');

  final manager = Manager(
    id: 'M-101',
    name: 'Tanvir Hossain',
    department: 'Engineering',
    subordinates: ['Rahim', 'Ayesha', 'Karim'],
  );

  print('Manager Name: ${manager.name}');
  print('Role Summary: ${manager.getRoleSummary()}');
  print('Team Size (Getter): ${manager.teamSize}');
  print('Has Large Team? (Getter): ${manager.hasLargeTeam}\n');

  // -------------------------------------------------------------------
  // [Topic 7] MIXIN (`with`) & EXTENSION (`extension on`)
  // -------------------------------------------------------------------
  print('--- [Topic 7] Mixin and Extension ---');

  // Mixin demonstration: AuditLogger is mixed into AuthService
  final authService = AuthService();
  authService.loginUser('emp_42');

  // Extension demonstration: Adds new methods to existing types
  const rawText = 'flutter mobile app';
  print('Extension on String: "${rawText.toCapitalized()}"');

  final employees = [
    const Employee(id: '1', name: 'Rahim', designation: 'Developer'),
    const Employee(id: '2', name: 'Ayesha', designation: 'Developer'),
    const Employee(id: '3', name: 'Karim', designation: 'Designer'),
  ];
  print('Extension on List<Employee>: Developers count = ${employees.countDevelopers()}\n');

  // -------------------------------------------------------------------
  // [Topic 8] `late` KEYWORD (Lazy Initialization)
  // -------------------------------------------------------------------
  print('--- [Topic 8] `late` Keyword ---');

  final config = AppConfig();
  // Notice: _loadDatabaseConfig() is NOT called yet!
  print('AppConfig instance created.');
  print('Now accessing config.databaseUrl:');
  // Only called when accessed for the first time:
  print('Database URL: ${config.databaseUrl}');
  print('Accessing again (will not reload): ${config.databaseUrl}\n');

  // -------------------------------------------------------------------
  // [Topic 10] STREAMS (Real-time updates with async* and yield)
  // -------------------------------------------------------------------
  print('--- [Topic 10] Streams (async* and await for) ---');

  print('Listening to Live Task Tracking Stream:');
  await for (final status in trackTaskStatus('Flutter App Release')) {
    print('   -> Stream Event: $status');
  }

  print('\n====================================================');
  print('   ALL REMAINING TOPICS PRACTICED SUCCESSFULLY!');
  print('====================================================');
}

// ---------------------------------------------------------------------
// HELPER CLASSES AND FUNCTIONS FOR THE DEMO
// ---------------------------------------------------------------------

// [Topic 3 Helper]: Record with positional & named fields
(String, int, {double avgSalary}) getDepartmentStats() {
  return ('Engineering', 12, avgSalary: 45000.00);
}

// [Topic 5 Helper]: Named parameters with defaults
void createProject({
  required String title,
  String priority = 'Medium', // default value
  bool isPrivate = false,     // default value
}) {
  print('Project Created: "$title" | Priority: $priority | Private: $isPrivate');
}

// [Topic 5 Helper]: Optional positional parameter in brackets [prefix]
String formatFullName(String first, String last, [String? prefix]) {
  return prefix != null ? '$prefix $first $last' : '$first $last';
}

// [Topic 6 Helper]: Abstract base class
abstract class Person {
  final String id;
  final String name;

  const Person({required this.id, required this.name});

  // Abstract method that subclasses must implement
  String getRoleSummary();
}

// [Topic 6 Helper]: Inheritance with `extends` and `super`
class Manager extends Person {
  final String department;
  final List<String> subordinates;

  Manager({
    required super.id,
    required super.name,
    required this.department,
    this.subordinates = const [],
  });

  // Getters
  int get teamSize => subordinates.length;
  bool get hasLargeTeam => teamSize >= 5;

  @override
  String getRoleSummary() =>
      '$name manages the $department department ($teamSize team members)';
}

// [Topic 7 Helper]: Mixin for reusable capability
mixin AuditLogger {
  void logAudit(String action) {
    final timestamp = DateTime.now().toIso8601String().substring(11, 19);
    print('   [AUDIT LOG $timestamp] Action performed: $action');
  }
}

// Using mixin with `with` keyword
class AuthService with AuditLogger {
  void loginUser(String userId) {
    logAudit('User $userId logged in successfully.');
  }
}

// [Topic 7 Helper]: Extension to add methods to existing String class
extension StringExtension on String {
  String toCapitalized() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

// Extension on List<Employee>
extension EmployeeListX on List<Employee> {
  int countDevelopers() =>
      where((emp) => emp.designation == 'Developer').length;
}

// [Topic 8 Helper]: `late` lazy initialization
class AppConfig {
  // `late` with initialization expression means it won't be evaluated
  // until someone reads `databaseUrl` for the first time!
  late final String databaseUrl = _loadDatabaseConfig();

  String _loadDatabaseConfig() {
    print('   -> [Lazy Loading] Connecting and loading DB config from storage...');
    return 'postgres://user:pass@localhost:5432/office_flow_db';
  }
}

// [Topic 10 Helper]: Stream Generator using `async*` and `yield`
Stream<String> trackTaskStatus(String taskName) async* {
  yield 'Task "$taskName": Started';
  await Future.delayed(const Duration(milliseconds: 250));

  yield 'Task "$taskName": In Progress (50%)';
  await Future.delayed(const Duration(milliseconds: 250));

  yield 'Task "$taskName": Code Review Completed (80%)';
  await Future.delayed(const Duration(milliseconds: 250));

  yield 'Task "$taskName": Deployed to Production (100%)';
}

