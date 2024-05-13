import 'package:flutter/cupertino.dart';

class BaseScreen extends StatelessWidget {
  final ObstructingPreferredSizeWidget? navigationBar;
  final Widget child;
  final bool? bottom;
  const BaseScreen({
    super.key,
    this.navigationBar,
    required this.child,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: navigationBar,
      child: SafeArea(bottom: bottom ?? true, child: child),
    );
  }
}
