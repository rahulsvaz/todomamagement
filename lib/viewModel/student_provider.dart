
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/student.dart';

class StudentProvider with ChangeNotifier {
  final Box<Student> _studentsBox = Hive.box<Student>('students');

  List<Student> get students => _studentsBox.values.toList();

  void addStudent(Student student) {
    _studentsBox.add(student);
    notifyListeners();
  }

  void updateStudent(int index, Student updatedStudent) {
    _studentsBox.putAt(index, updatedStudent);
    notifyListeners();
  }

  void deleteStudent(int index) {
    _studentsBox.deleteAt(index);
    notifyListeners();
  }
}
