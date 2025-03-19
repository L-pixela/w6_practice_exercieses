import 'package:flutter/material.dart';
import 'package:w6_assignment/EX-1-START-CODE/repository/courses_repository.dart';

import '../models/courses_model.dart';

class CoursesProvider with ChangeNotifier {
  final CoursesRepository _repository;

  CoursesProvider({required CoursesRepository repository})
      : _repository = repository;

  List<Course> getCourses() {
    return _repository.getCourses();
  }

  Course getCourseFor(String courseName) {
    try {
      return _repository
          .getCourses()
          .firstWhere((course) => course.name == courseName);
    } catch (e) {
      return throw Exception('Course not found');
    }
  }

  void addScore(String courseName, CourseScore score) {
    _repository.addScore(courseName, score);
    notifyListeners();
  }
}
