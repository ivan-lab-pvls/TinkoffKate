import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/features/quiz/data/author.dart';

enum AuthorAvatarType { vertical, horizonal }

class AuthorAvatar extends StatelessWidget {
  final Author author;
  final AuthorAvatarType type;
  const AuthorAvatar({
    super.key,
    required this.author,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AuthorAvatarType.vertical:
        return Column(
          children: [
            Image.asset(
              author.assetName,
              width: 40.r,
              height: 40.r,
            ),
            SizedBox(height: 8.h),
            Text(
              author.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        );
      case AuthorAvatarType.horizonal:
        return Row(
          children: [
            Image.asset(
              author.assetName,
              width: 40.r,
              height: 40.r,
            ),
            SizedBox(width: 8.w),
            Text(
              author.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        );
    }
  }
}
