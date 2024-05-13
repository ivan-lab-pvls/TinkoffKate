import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/features/quiz/data/entry.dart';
import 'package:zenmoney/features/quiz/data/question.dart';
import 'package:zenmoney/features/quiz/view/widget/answer_widget.dart';
import 'package:zenmoney/features/quiz/view/widget/answers_expander.dart';
import 'package:zenmoney/features/quiz/view/widget/author_avatar.dart';
import 'package:zenmoney/features/quiz/view/widget/chat_bubble.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  const QuestionWidget({super.key, required this.question});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthorAvatar(
                author: widget.question.author,
                type: AuthorAvatarType.vertical),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                children: [
                  ChatBubble(content: widget.question.content),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget.question.answers.isNotEmpty) {
                            return AnswersExpander(
                              question: widget.question,
                              expanded: expanded,
                              onPressed: () =>
                                  setState(() => expanded = !expanded),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      Text(
                        widget.question.date,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      if (widget.question.answers.isNotEmpty && expanded) {
                        return Column(
                          children: [
                            SizedBox(height: 12.h),
                            ...List.generate(
                              widget.question.answers.length,
                              (index) => AnswerWidget(
                                  answer: widget.question.answers[index]),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
