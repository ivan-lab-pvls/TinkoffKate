import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/features/quiz/data/quiz.dart';
import 'package:zenmoney/features/quiz/view/widget/author_avatar.dart';
import 'package:zenmoney/features/quiz/view/widget/author_miniature.dart';

class QuizWidget extends StatelessWidget {
  final Quiz quiz;
  const QuizWidget({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.router.push(QuizSingleRoute(quiz: quiz)),
      child: Section(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: borderRadius12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quiz.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                quiz.date,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  AuthorMiniature(
                      assetName: quiz.questions[0].author.assetName),
                  AuthorMiniature(
                      assetName: quiz.questions[1].author.assetName),
                  AuthorMiniature(
                      assetName: quiz.questions[2].author.assetName),
                  SizedBox(width: 8.w),
                  Text(
                    '+2',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
