import 'package:appsflyer_sdk/appsflyer_sdk.dart';
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

final di = GetIt.instance;
String datay = '';
late AppsflyerSdk _appsflyerSdk;
String adId = '';
bool stat = false;
String paramsFirst = '';
String paramsSecond = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
late Box<MoneyFlow> moneyFlowBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  await initHive();
  await getTracking();
  await adsax();
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

Future<void> adsax() async {
  final AppsFlyerOptions options = AppsFlyerOptions(
    showDebug: false,
    afDevKey: 'knxyqhoEmbXe4zrXV6ocB7',
    appId: '6502603086',
    timeToWaitForATTUserAuthorization: 15,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  _appsflyerSdk = AppsflyerSdk(options);

  await _appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );
  _appsflyerSdk.onAppOpenAttribution((res) {
    _deepLinkData = res;
    paramsSecond = res['payload']
        .entries
        .where((e) => ![
              'install_time',
              'click_time',
              'af_status',
              'is_first_launch'
            ].contains(e.key))
        .map((e) => '&${e.key}=${e.value}')
        .join();
  });
  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    paramsFirst = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
  });

  _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    _deepLinkData = dp.toJson();
  });

  _appsflyerSdk.startSDK(
    onSuccess: () {
      _appsflyerSdk.logEvent("testEventNotForAnalytics", {
        "id": {'id': adId},
      });
      print("AppsFlyer SDK initialized successfully.");
    },
  );
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
