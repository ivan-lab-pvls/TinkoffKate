import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:zenmoney/common/layout/base_screen.dart';
import 'package:zenmoney/common/widget/custom_back_button.dart';
import 'package:zenmoney/features/quiz/data/quiz.dart';
import 'package:zenmoney/features/quiz/view/widget/question_widget.dart';

@RoutePage()
class QuizSingleScreen extends StatefulWidget {
  final Quiz quiz;
  const QuizSingleScreen({super.key, required this.quiz});

  @override
  State<QuizSingleScreen> createState() => _QuizSingleScreenState();
}

class _QuizSingleScreenState extends State<QuizSingleScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Quiz'),
        leading: CustomBackButton(),
        border: null,
      ),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final question = widget.quiz.questions[index];
              return QuestionWidget(question: question);
            }, childCount: widget.quiz.questions.length),
          ),
        ],
      ),
    );
  }
}
