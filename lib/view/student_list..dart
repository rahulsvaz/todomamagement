import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewModel/student_provider.dart';
import 'student_form.dart';


class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final students = Provider.of<StudentProvider>(context).students;

    return Scaffold(
      appBar: AppBar(title: const Text('Student List')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: FileImage(File(student.imageUrl))),
            title: Text(student.name),
            subtitle: Text('Age: ${student.age}'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentForm(student: student, index: index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentForm()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
