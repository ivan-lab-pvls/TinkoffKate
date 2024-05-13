import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/features/news/data/news.dart';

class NewsWidget extends StatelessWidget {
  final News news;
  const NewsWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.router.push(NewsSingleRoute(news: news)),
      child: Container(
        padding: EdgeInsets.only(left: 8.w, top: 8.h, right: 8.w, bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: borderRadius16,
          color: surfaceColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: borderRadius16,
                child: Image.asset(
                  news.assetName,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              news.title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4.h),
            Text(
              news.date,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
