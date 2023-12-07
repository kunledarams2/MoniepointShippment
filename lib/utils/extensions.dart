import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension StringExtensions on String {
  String get svg => "assets/svg/$this.svg";
  String get png => "assets/images/$this.png";
}
extension IntExtensions on double {
  double toLineHeight(double fontSize) {
    return this / fontSize;
  }
}
extension PaddingExtensions on Widget {
  Widget paddingAll(double padding) => Padding(
    padding: EdgeInsets.all(
      padding.w,
    ),
    child: this,
  );
  Widget paddingOnly(
      {double left = 0,
        double right = 0,
        double bottom = 0,
        double top = 0}) =>
      Padding(
        padding:
        EdgeInsets.only(left: left, right: right, bottom: bottom, top: top),
        child: this,
      );
  Widget paddingSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal.w,
          vertical: vertical.h,
        ),
        child: this,
      );

  Widget paddingFromLTRB({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.fromLTRB(
          left.w,
          top.h,
          right.w,
          bottom.h,
        ),
        child: this,
      );
}