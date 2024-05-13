import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/widget/custom_icon.dart';

class ContainedIcon extends StatelessWidget {
  final String assetName;
  final Color color;
  const ContainedIcon({
    super.key,
    required this.assetName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: borderRadius16,
        color: surfaceColor,
      ),
      child: CustomIcon(
        assetName: assetName,
        color: color,
      ),
    );
  }
}
