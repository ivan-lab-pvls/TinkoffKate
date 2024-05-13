import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/common/layout/base_screen.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/features/quiz/data/quiz.dart';
import 'package:zenmoney/features/quiz/view/widget/quiz_widget.dart';

@RoutePage()
class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            transitionBetweenRoutes: false,
            largeTitle: Text('Quiz'),
            border: null,
            stretch: true,
          ),
          const SliverToBoxAdapter(
            child: Section(child: Text('2 topics')),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SizedBox(height: 16.h),
                QuizWidget(quiz: Quiz.quizList[0]),
                SizedBox(height: 8.h),
                QuizWidget(quiz: Quiz.quizList[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
