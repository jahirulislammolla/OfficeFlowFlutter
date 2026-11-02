class Employee {
  final String id;
  final String name;
  final String designation;
  final String? email; // Nullable field to demonstrate null safety without `!`

  const Employee({
    required this.id,
    required this.name,
    required this.designation,
    this.email,
  });

  // Immutability demonstration: we cannot change properties directly,
  // instead we return a new updated instance via copyWith.
  Employee copyWith({
    String? id,
    String? name,
    String? designation,
    String? email,
  }) {
    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      email: email ?? this.email,
    );
  }

  @override
  String toString() =>
      'Employee(id: $id, name: $name, designation: $designation, email: $email)';
}
