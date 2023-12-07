import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key,
  required this.dividerColor,});
  final Color dividerColor;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1.sw,
      height: 1.h,
      color:dividerColor,
    );
  }
}
