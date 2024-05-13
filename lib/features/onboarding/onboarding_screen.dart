import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/main.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/layout/section.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Section(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/onboarding/onb1.png'),
                      SizedBox(height: 16.h),
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius16,
                          color: surfaceColor,
                        ),
                        child: Text(
                          '01',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Welcome to our financial mobile application!',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 32.sp),
                      ),
                      SizedBox(height: 12.h),
                      const Text(
                        'Here you can easily and conveniently manage your finances, track expenses, income, and much more.',
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
                Section(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/onboarding/onb2.png'),
                      SizedBox(height: 16.h),
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius16,
                          color: surfaceColor,
                        ),
                        child: Text(
                          '02',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'All your finances in one place',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 32.sp),
                      ),
                      SizedBox(height: 12.h),
                      const Text(
                        'Turn financial management into an engaging and efficient activity with our app!',
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ],
            ),
            Section(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Builder(builder: (context) {
                          if (page == 0) {
                            return CupertinoButton(
                              color: Theme.of(context).highlightColor,
                              child: Text(
                                'Next',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              onPressed: () {
                                setState(() {
                                  pageController.animateToPage(
                                    ++page,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.decelerate,
                                  );
                                });
                              },
                            );
                          } else {
                            return CupertinoButton(
                              color: Theme.of(context).highlightColor,
                              child: Text(
                                'Get started',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              onPressed: () {
                                di<SharedPreferences>()
                                    .setBool('isFirstTime', false);
                                context.router.replace(const FinancesRoute());
                              },
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        child: Text(
                          'Terms of Use',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onPressed: () =>
                            context.router.push(const TermsOfUseRoute()),
                      ),
                      Text(
                        ' / ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CupertinoButton(
                        child: Text(
                          'Privacy Policy',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onPressed: () =>
                            context.router.push(const PrivacyPolicyRoute()),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
