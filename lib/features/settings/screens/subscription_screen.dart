import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:zenmoney/app/config/remote_config.dart';
import 'package:zenmoney/main.dart';
import 'package:zenmoney/common/layout/base_screen.dart';
import 'package:zenmoney/common/widget/custom_back_button.dart';

@RoutePage()
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Subscription info'),
        leading: CustomBackButton(),
        border: null,
      ),
      bottom: false,
      child: Builder(
        builder: (context) {
          final subscription = di<RemoteConfig>().subscription;
          if (subscription != null && subscription != '') {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(subscription),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Subscription info'),
            );
          }
        },
      ),
    );
  }
}
