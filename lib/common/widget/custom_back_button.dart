import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:zenmoney/common/widget/rounded_contained_icon.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  const CustomBackButton({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainedIcon(
      assetName: 'assets/icons/misc/back.svg',
      onPressed: () => context.router.popForced(),
      color: color,
    );
  }
}
