import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_assignment/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:w6_assignment/EX-1-START-CODE/repository/courses_mock_repository.dart';
import 'package:w6_assignment/EX-1-START-CODE/repository/courses_repository.dart';

import 'screens/course_list_screen.dart';

void main() {
  //1. Initialize the Repository
  CoursesRepository courseRepo = CoursesMockRepository();

  runApp(//2. Initialize the Provider
      ChangeNotifierProvider(
    create: (context) => CoursesProvider(repository: courseRepo),
    child: MyApp(
      courseRepo: courseRepo,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final CoursesRepository courseRepo;
  const MyApp({super.key, required this.courseRepo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseListScreen(),
    );
  }
}
