import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String studentName = 'Jayed Khan';
    const int studentId = 1001;
    double marks = 85.5;
    bool isActive = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Student Profile'),
        ),
        body: Padding( 
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $studentName'),
              Text('ID: $studentId'),
              Text('Marks: $marks'),
              Text(
                'Status: ${isActive ? "Active" : "Inactive"}',
              ),
              Text(
                'Result: ${marks >= 40 ? "Passed" : "Failed"}',
              ),
            ],
          )
        )
        
      ),
    );
  }
}
