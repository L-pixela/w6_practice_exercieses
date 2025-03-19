import 'package:w6_assignment/EX-1-START-CODE/models/courses_model.dart';

import 'courses_repository.dart';

class CoursesMockRepository extends CoursesRepository {
  final List<Course> _courses = [Course(name: 'HTML'), Course(name: 'JAVA')];

  @override
  List<Course> getCourses() {
    return _courses;
  }

  @override
  void addScore(String courseName, CourseScore score) {
    Course courseFound = _courses.firstWhere((c) => c.name == courseName);
    courseFound.scores.add(score);
  }
}
