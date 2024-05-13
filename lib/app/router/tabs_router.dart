import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/widget/custom_icon.dart';

@RoutePage()
class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeColor = Theme.of(context).primaryColor;
    final disabledColor = Theme.of(context).disabledColor;
    return AutoTabsScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      routes: const [
        FinancesRoute(),
        QuizRoute(),
        NewsRoute(),
        SettingsRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          backgroundColor: surfaceColor,
          activeColor: activeColor,
          currentIndex: tabsRouter.activeIndex,
          onTap: (value) {
            tabsRouter.setActiveIndex(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: CustomIcon(
                  assetName: 'assets/icons/navbar/finance.svg',
                  color: disabledColor),
              activeIcon: CustomIcon(
                  assetName: 'assets/icons/navbar/finance.svg',
                  color: activeColor),
              label: 'Finance',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                  assetName: 'assets/icons/navbar/quiz.svg',
                  color: disabledColor),
              activeIcon: CustomIcon(
                  assetName: 'assets/icons/navbar/quiz.svg',
                  color: activeColor),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                  assetName: 'assets/icons/navbar/news.svg',
                  color: disabledColor),
              activeIcon: CustomIcon(
                  assetName: 'assets/icons/navbar/news.svg',
                  color: activeColor),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                  assetName: 'assets/icons/navbar/settings.svg',
                  color: disabledColor),
              activeIcon: CustomIcon(
                  assetName: 'assets/icons/navbar/settings.svg',
                  color: activeColor),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
