import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorMiniature extends StatelessWidget {
  final String assetName;
  const AuthorMiniature({
    super.key,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.75,
      child: Image.asset(
        assetName,
        width: 32.r,
        height: 32.r,
      ),
    );
  }
}
