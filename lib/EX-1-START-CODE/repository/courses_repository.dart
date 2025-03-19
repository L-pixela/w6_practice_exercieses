import '../models/courses_model.dart';

abstract class CoursesRepository {
  List<Course> getCourses();

  void addScore(String courseName, CourseScore score);
}
