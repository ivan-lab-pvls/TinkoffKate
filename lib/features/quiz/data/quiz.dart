import 'package:zenmoney/features/quiz/data/question.dart';

class Quiz {
  final String title;
  final String date;
  final List<Question> questions;

  Quiz({
    required this.title,
    required this.date,
    required this.questions,
  });

  static final List<Quiz> quizList = [
    Quiz(
      title: 'Convenience of using the mobile banking application',
      date: '13 Apr, 2024',
      questions: Question.questionList1,
    ),
    Quiz(
      title: 'Additional features and improvements',
      date: '13 Apr, 2024',
      questions: Question.questionList2,
    ),
  ];
}
