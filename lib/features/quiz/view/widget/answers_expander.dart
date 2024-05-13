import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/widget/custom_icon.dart';
import 'package:zenmoney/features/quiz/data/question.dart';

class AnswersExpander extends StatelessWidget {
  final Question question;
  final bool expanded;
  final VoidCallback onPressed;

  const AnswersExpander({
    super.key,
    required this.question,
    required this.expanded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: borderRadius12,
          color: expanded
              ? Theme.of(context).primaryColor
              : Theme.of(context).highlightColor,
        ),
        child: Row(
          children: [
            CustomIcon(
              assetName: 'assets/icons/misc/answer.svg',
              color: expanded
                  ? const Color.fromRGBO(250, 250, 250, 0.4)
                  : Theme.of(context).primaryColor,
            ),
            SizedBox(width: 4.w),
            Text(
              'Answers: ${question.answers.length}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: expanded ? Colors.white : Colors.black),
            ),
            SizedBox(width: 27.w),
            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: expanded
                    ? Theme.of(context).highlightColor
                    : Theme.of(context).primaryColor,
              ),
              child: expanded
                  ? Icon(
                      Icons.keyboard_arrow_up,
                      color: Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
