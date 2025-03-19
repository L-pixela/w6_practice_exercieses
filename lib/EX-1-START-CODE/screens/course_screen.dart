import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_assignment/EX-1-START-CODE/provider/courses_provider.dart';
import '../models/courses_model.dart';
import 'course_score_form.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key, required this.course});

  final Course course;

  void _addScore(BuildContext context) async {
    final courseProvider = context.read<CoursesProvider>();
    CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
        MaterialPageRoute(builder: (ctx) => const CourseScoreForm()));

    if (newScore != null) {
      courseProvider.addScore(course.name, newScore);
    }
  }

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          course.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => _addScore(context), icon: const Icon(Icons.add)),
        ],
      ),
      body:
          Consumer<CoursesProvider>(builder: (context, courseProvider, child) {
        Widget content = const Center(child: Text('No Scores added yet.'));
        final updatedCourse = courseProvider.getCourseFor(course.name);
        final scores = updatedCourse.scores;
        // print("Cookies is here!");

        if (scores.isNotEmpty) {
          content = ListView.builder(
            itemCount: scores.length,
            itemBuilder: (ctx, index) => ListTile(
              title: Text(scores[index].studentName),
              trailing: Text(
                scores[index].studenScore.toString(),
                style: TextStyle(
                  color: scoreColor(scores[index].studenScore),
                  fontSize: 15,
                ),
              ),
            ),
          );
        }
        return content;
      }),
    );
  }
}
