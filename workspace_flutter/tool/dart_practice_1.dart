void main(){
    const companyName = 'Digit Gate IT';
    String employeeName = 'Jahir';
    int completedTasks = 5;
    double salary = 25000.50;
    bool isActive = true;

    print('$employeeName works at $companyName');

    print('Salary: $salary');

    if (isActive && completedTasks >= 5) {
        print('Good progress!');
    }

    final tasks= ['Login page', 'Dashboard', 'Attendance'];

    for (final task in tasks)
    {
        print(task);
    }
    
    print(greet(employeeName));

    final employeeJair = Employee(id: '11111', name: 'jahir', designation: 'Senior Web Developer');
    print(employeeJair.id);
    print(employeeJair.name);
    print(employeeJair.designation);
}

class Employee {
  final String id;
  final String name;
  final String? designation;

  const Employee({
    required this.id,
    required this.name,
    required this.designation,
  });
}

String greet(String name){
    return 'Hello $name!';
}