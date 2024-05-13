import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:zenmoney/app/config/remote_config.dart';
import 'package:zenmoney/main.dart';
import 'package:zenmoney/common/layout/base_screen.dart';

@RoutePage()
class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Promotion'),
      ),
      bottom: false,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(di<RemoteConfig>().promotion!),
        ),
      ),
    );
  }
}
