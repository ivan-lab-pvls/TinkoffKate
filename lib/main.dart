import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:zenmoney/app/init/init_di.dart';
import 'package:zenmoney/app/init/init_hive.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/features/finances/model/money_flow/money_flow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zenmoney/features/finances/controller/money_flow_cubit.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';

final di = GetIt.instance;
late AppsflyerSdk _appsflyerSdk;
late Box<MoneyFlow> moneyFlowBox;
String acceptPromo = '';
String cancelPromo = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  await initHive();
  await getTracking();
  await afGazel();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final router = await AppRouter.create();

  runApp(BlocProvider(
    create: (context) => MoneyFlowCubit(),
    child: MainApp(appRouter: router),
  ));
}

Future<void> getTracking() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

Future<void> afGazel() async {
  try {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: true,
      afDevKey: 'xmcqmbVvE5e4e2UBZ3twRT',
      appId: '6502603086',
      timeToWaitForATTUserAuthorization: 50,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
      manualStart: true,
    );
    _appsflyerSdk = AppsflyerSdk(options);

    Map result = await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    print("SDK init result: $result");

    _appsflyerSdk.startSDK(
      onSuccess: () async {
        print("AppsFlyer SDK initialized successfully.");
        String? appsflyerId = await _appsflyerSdk.getAppsFlyerUID();
        print("AppsFlyer ID: $appsflyerId");
        await _appsflyerSdk.logEvent("tester", {});
      },
      onError: (int errorCode, String errorMessage) {
        print(
            "Error initializing AppsFlyer SDK: Code $errorCode - $errorMessage");
      },
    );

    _appsflyerSdk.onAppOpenAttribution((res) {
      print("onAppOpenAttribution: $res");
      _deepLinkData = res;
      cancelPromo = res['payload']
          .entries
          .where((e) => ![
                'install_time',
                'click_time',
                'af_status',
                'is_first_launch'
              ].contains(e.key))
          .map((e) => '&${e.key}=${e.value}')
          .join();
      print("cancelPromo: $cancelPromo");
    });

    _appsflyerSdk.onInstallConversionData((res) {
      print("onInstallConversionData: $res");
      _gcd = res;
      _isFirstLaunch = res['payload']['is_first_launch'];
      _afStatus = res['payload']['af_status'];
      acceptPromo = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
      print("acceptPromo: $acceptPromo");
    });

    _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
      switch (dp.status) {
        case Status.FOUND:
          print("Deep link found: ${dp.deepLink?.toString()}");
          break;
        case Status.NOT_FOUND:
          print("Deep link not found");
          break;
        case Status.ERROR:
          print("Deep link error: ${dp.error}");
          break;
        case Status.PARSE_ERROR:
          print("Deep link status parsing error");
          break;
      }
      print("onDeepLinking res: ${dp.toString()}");
      _deepLinkData = dp.toJson();
    });
  } catch (e) {
    print("Error initializing AppsFlyer SDK: $e");
  }
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;

  MainApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
          theme: theme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
