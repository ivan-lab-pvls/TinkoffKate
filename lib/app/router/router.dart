import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zenmoney/app/config/remote_config.dart';
import 'package:zenmoney/app/router/tabs_router.dart';
import 'package:zenmoney/main.dart';
import 'package:zenmoney/features/finances/model/money_flow/money_flow.dart';
import 'package:zenmoney/features/finances/model/money_flow_type/money_flow_type.dart';
import 'package:zenmoney/features/finances/view/layout/finances_screen.dart';
import 'package:zenmoney/features/finances/view/layout/money_flow_screen.dart';
import 'package:zenmoney/features/news/data/news.dart';
import 'package:zenmoney/features/news/view/news_screen.dart';
import 'package:zenmoney/features/news/view/news_single_screen.dart';
import 'package:zenmoney/features/news/view/news_wrapper_screen.dart';
import 'package:zenmoney/features/onboarding/onboarding_screen.dart';
import 'package:zenmoney/features/quiz/data/quiz.dart';
import 'package:zenmoney/features/quiz/view/layout/quiz_screen.dart';
import 'package:zenmoney/features/quiz/view/layout/quiz_single_screen.dart';
import 'package:zenmoney/features/quiz/view/layout/quiz_wrapper_screen.dart';
import 'package:zenmoney/features/settings/promotion_screen.dart';
import 'package:zenmoney/features/settings/screens/privacy_policy_screen.dart';
import 'package:zenmoney/features/settings/screens/subscription_screen.dart';
import 'package:zenmoney/features/settings/screens/support_screen.dart';
import 'package:zenmoney/features/settings/screens/terms_of_use_screen.dart';
import 'package:zenmoney/features/settings/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    final isFirstTime = di<SharedPreferences>().getBool('isFirstTime');
    final promotion = di<RemoteConfig>().promotion;
    final showPromotion = promotion != null && promotion.isNotEmpty;
    return [
      AutoRoute(page: PromotionRoute.page, initial: showPromotion),
      AutoRoute(
        page: OnboardingRoute.page,
        initial: isFirstTime! && !showPromotion,
      ),
      AutoRoute(
        page: TabBarRoute.page,
        initial: !isFirstTime && !showPromotion,
        children: [
          AutoRoute(page: FinancesRoute.page),
          AutoRoute(
            page: NewsWrapperRoute.page,
            children: [
              AutoRoute(page: NewsRoute.page),
              AutoRoute(page: NewsSingleRoute.page),
            ],
          ),
          AutoRoute(
            page: QuizWrapperRoute.page,
            children: [
              AutoRoute(page: QuizRoute.page),
              AutoRoute(page: QuizSingleRoute.page),
            ],
          ),
          AutoRoute(page: SettingsRoute.page),
        ],
      ),
      AutoRoute(page: MoneyFlowRoute.page),
      AutoRoute(page: SubscriptionRoute.page),
      AutoRoute(page: PrivacyPolicyRoute.page),
      AutoRoute(page: SupportRoute.page),
      AutoRoute(page: TermsOfUseRoute.page),
    ];
  }
}
