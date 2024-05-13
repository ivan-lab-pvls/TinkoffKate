import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  final String assetName;
  final Color color;

  const CustomIcon({super.key, required this.assetName, required this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      height: 24.r,
      width: 24.r,
      assetName,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
