import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/widget/contained_icon.dart';

class CustomTile extends StatelessWidget {
  final String assetName;
  final Widget child;
  final VoidCallback? onPressed;
  const CustomTile({
    super.key,
    required this.assetName,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: borderRadius12,
          color: surfaceColor,
        ),
        child: Row(
          children: [
            ContainedIcon(
              assetName: assetName,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: child,
            ),
          ],
        ),
      );
    } else {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
          decoration: BoxDecoration(
            borderRadius: borderRadius12,
            color: surfaceColor,
          ),
          child: Row(
            children: [
              ContainedIcon(
                assetName: assetName,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      );
    }
  }
}
