import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/features/quiz/data/entry.dart';
import 'package:zenmoney/features/quiz/view/widget/author_avatar.dart';
import 'package:zenmoney/features/quiz/view/widget/chat_bubble.dart';

class AnswerWidget extends StatelessWidget {
  final Entry answer;
  const AnswerWidget({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthorAvatar(author: answer.author, type: AuthorAvatarType.horizonal),
          SizedBox(height: 8.h),
          ChatBubble(content: answer.content),
          SizedBox(height: 8.h),
          Text(
            answer.date,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
