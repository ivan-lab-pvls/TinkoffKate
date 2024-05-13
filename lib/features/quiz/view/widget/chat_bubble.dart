import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/theme.dart';

class ChatBubble extends StatelessWidget {
  final String content;
  const ChatBubble({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
          bottomLeft: Radius.circular(16.r),
        ),
      ),
      child: Text(
        content,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
