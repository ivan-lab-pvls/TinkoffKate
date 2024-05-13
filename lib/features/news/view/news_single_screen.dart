import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/common/widget/custom_back_button.dart';
import 'package:zenmoney/features/news/data/news.dart';

@RoutePage()
class NewsSingleScreen extends StatelessWidget {
  final News news;
  const NewsSingleScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                collapsedHeight: 56,
                surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                leading: const CustomBackButton(
                  color: Color.fromRGBO(212, 214, 210, 1),
                ),
                expandedHeight: 315.h,
                pinned: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ],
                  titlePadding: EdgeInsets.all(16.r),
                  centerTitle: false,
                  background: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(news.assetName),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Section(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      Text(
                        news.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 4.h),
                      Text(news.date),
                      SizedBox(height: 12.h),
                      Text(news.content),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
