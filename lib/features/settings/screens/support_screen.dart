import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:zenmoney/app/config/remote_config.dart';
import 'package:zenmoney/main.dart';
import 'package:zenmoney/common/layout/base_screen.dart';
import 'package:zenmoney/common/widget/custom_back_button.dart';

@RoutePage()
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Support page'),
        leading: CustomBackButton(),
        border: null,
      ),
      bottom: false,
      child: Builder(
        builder: (context) {
          final support = di<RemoteConfig>().support;
          if (support != null && support != '') {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(support),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Support page'),
            );
          }
        },
      ),
    );
  }
}
