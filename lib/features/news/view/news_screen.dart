import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/layout/base_screen.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/features/news/data/news.dart';
import 'package:zenmoney/features/news/view/news_widget.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            transitionBetweenRoutes: false,
            largeTitle: Text('News'),
            border: null,
            stretch: true,
          ),
          const SliverToBoxAdapter(
            child: Section(child: Text('6 news')),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
                top: 8.h, bottom: 32.h, right: 16.w, left: 16.w),
            sliver: SliverList.separated(
              itemCount: News.newsList.length,
              itemBuilder: (context, index) {
                final news = News.newsList[index];
                return NewsWidget(news: news);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
            ),
          ),
        ],
      ),
    );
  }
}
