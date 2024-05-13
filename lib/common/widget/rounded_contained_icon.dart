import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/widget/custom_icon.dart';

class RoundedContainedIcon extends StatelessWidget {
  final String assetName;
  final VoidCallback? onPressed;
  final Color? color;
  const RoundedContainedIcon({
    super.key,
    required this.assetName,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (onPressed != null) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color ?? surfaceColor,
          ),
          child: CustomIcon(
            assetName: assetName,
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color ?? surfaceColor,
        ),
        child: CustomIcon(
          assetName: assetName,
          color: Theme.of(context).primaryColor,
        ),
      );
    }
  }
}
