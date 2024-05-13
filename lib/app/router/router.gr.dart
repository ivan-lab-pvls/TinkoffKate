// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FinancesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinancesScreen(),
      );
    },
    MoneyFlowRoute.name: (routeData) {
      final args = routeData.argsAs<MoneyFlowRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MoneyFlowScreen(
          key: args.key,
          type: args.type,
          moneyFlow: args.moneyFlow,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsScreen(),
      );
    },
    NewsSingleRoute.name: (routeData) {
      final args = routeData.argsAs<NewsSingleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsSingleScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsWrapperScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PromotionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromotionScreen(),
      );
    },
    QuizRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizScreen(),
      );
    },
    QuizSingleRoute.name: (routeData) {
      final args = routeData.argsAs<QuizSingleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuizSingleScreen(
          key: args.key,
          quiz: args.quiz,
        ),
      );
    },
    QuizWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizWrapperScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SubscriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubscriptionScreen(),
      );
    },
    SupportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupportScreen(),
      );
    },
    TabBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabBarScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [FinancesScreen]
class FinancesRoute extends PageRouteInfo<void> {
  const FinancesRoute({List<PageRouteInfo>? children})
      : super(
          FinancesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinancesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MoneyFlowScreen]
class MoneyFlowRoute extends PageRouteInfo<MoneyFlowRouteArgs> {
  MoneyFlowRoute({
    Key? key,
    required MoneyFlowType type,
    MoneyFlow? moneyFlow,
    List<PageRouteInfo>? children,
  }) : super(
          MoneyFlowRoute.name,
          args: MoneyFlowRouteArgs(
            key: key,
            type: type,
            moneyFlow: moneyFlow,
          ),
          initialChildren: children,
        );

  static const String name = 'MoneyFlowRoute';

  static const PageInfo<MoneyFlowRouteArgs> page =
      PageInfo<MoneyFlowRouteArgs>(name);
}

class MoneyFlowRouteArgs {
  const MoneyFlowRouteArgs({
    this.key,
    required this.type,
    this.moneyFlow,
  });

  final Key? key;

  final MoneyFlowType type;

  final MoneyFlow? moneyFlow;

  @override
  String toString() {
    return 'MoneyFlowRouteArgs{key: $key, type: $type, moneyFlow: $moneyFlow}';
  }
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsSingleScreen]
class NewsSingleRoute extends PageRouteInfo<NewsSingleRouteArgs> {
  NewsSingleRoute({
    Key? key,
    required News news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsSingleRoute.name,
          args: NewsSingleRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsSingleRoute';

  static const PageInfo<NewsSingleRouteArgs> page =
      PageInfo<NewsSingleRouteArgs>(name);
}

class NewsSingleRouteArgs {
  const NewsSingleRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final News news;

  @override
  String toString() {
    return 'NewsSingleRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsWrapperScreen]
class NewsWrapperRoute extends PageRouteInfo<void> {
  const NewsWrapperRoute({List<PageRouteInfo>? children})
      : super(
          NewsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromotionScreen]
class PromotionRoute extends PageRouteInfo<void> {
  const PromotionRoute({List<PageRouteInfo>? children})
      : super(
          PromotionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizScreen]
class QuizRoute extends PageRouteInfo<void> {
  const QuizRoute({List<PageRouteInfo>? children})
      : super(
          QuizRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizSingleScreen]
class QuizSingleRoute extends PageRouteInfo<QuizSingleRouteArgs> {
  QuizSingleRoute({
    Key? key,
    required Quiz quiz,
    List<PageRouteInfo>? children,
  }) : super(
          QuizSingleRoute.name,
          args: QuizSingleRouteArgs(
            key: key,
            quiz: quiz,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizSingleRoute';

  static const PageInfo<QuizSingleRouteArgs> page =
      PageInfo<QuizSingleRouteArgs>(name);
}

class QuizSingleRouteArgs {
  const QuizSingleRouteArgs({
    this.key,
    required this.quiz,
  });

  final Key? key;

  final Quiz quiz;

  @override
  String toString() {
    return 'QuizSingleRouteArgs{key: $key, quiz: $quiz}';
  }
}

/// generated route for
/// [QuizWrapperScreen]
class QuizWrapperRoute extends PageRouteInfo<void> {
  const QuizWrapperRoute({List<PageRouteInfo>? children})
      : super(
          QuizWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SubscriptionScreen]
class SubscriptionRoute extends PageRouteInfo<void> {
  const SubscriptionRoute({List<PageRouteInfo>? children})
      : super(
          SubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SupportScreen]
class SupportRoute extends PageRouteInfo<void> {
  const SupportRoute({List<PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabBarScreen]
class TabBarRoute extends PageRouteInfo<void> {
  const TabBarRoute({List<PageRouteInfo>? children})
      : super(
          TabBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
