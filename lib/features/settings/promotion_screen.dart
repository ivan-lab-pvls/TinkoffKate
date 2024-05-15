import 'dart:ffi';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:zenmoney/app/router/router.dart';

@RoutePage()
class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  late AppsflyerSdk _appsflyerSdk;
  String adId = '';
  bool stat = false;
  String paramsFirst = '';
  String paramsSecond = '';
  Map _deepLinkData = {};
  Map _gcd = {};
  bool _isFirstLaunch = false;
  String _afStatus = '';
  @override
  void initState() {
    super.initState();
    getTracking();
    adsax();
  }

  Future<void> getTracking() async {
    final TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();
    print(status);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(promox),
          ),
        ),
      ),
    );
  }
}
