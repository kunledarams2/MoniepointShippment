import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../styles/__export__.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
  this.fillColor,
  this.isFilled,
  this.suffixIcon,
  this.prefixIcon,
  this.focusedErrorBorder,
  this.focusedBorder,
  this.enabledBorder,
  this.disabledBorder,
  this.hintText,
  this.labelText,
  this.contentPadding,
  this.hintStyle,
  this.labelStyle,
  this.border,
  this.textStyle,
  this.onChange});
  final Color? fillColor;
  final bool? isFilled;
  final Widget?suffixIcon,prefixIcon;
  final InputBorder?focusedErrorBorder,focusedBorder,disabledBorder,enabledBorder,border;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelText,hintText;
  final TextStyle? hintStyle,labelStyle,textStyle;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      style:textStyle,
      onChanged: onChange,
      decoration: InputDecoration(
        fillColor: fillColor??CustomColors.whiteColor,
        filled: isFilled??true,
        suffixIcon:suffixIcon??Container(
            margin: const EdgeInsets.all(4),
            width: 40.w,
            height: 40.h,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: CustomColors.orangeColor71,
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset("ic_scan".svg,width: 24.w,height: 24.h,fit: BoxFit.fill,)),
        prefixIcon: prefixIcon??SvgPicture.asset("ic_search".svg).paddingAll(12),
        focusedErrorBorder: focusedErrorBorder??OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(
              color: CustomColors.whiteColor,
              width: 1.w,
            )),
        focusedBorder: focusedBorder??OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(
              color: CustomColors.whiteColor,
              width: 1.w,
            )),
        enabledBorder: enabledBorder??OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(
              color: CustomColors.whiteColor,
              width: 1.w,
            )),
        disabledBorder: disabledBorder??OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            borderSide: const BorderSide(
              color: CustomColors.whiteColor,
              width: 1,
            )),
        contentPadding: contentPadding?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText??"Enter the receipt number...",
        hintText: hintText??"",

        hintStyle: hintStyle??CustomStyle.textStyleInter.copyWith(
          fontSize: 16.sp,
          color: CustomColors.gray500,
          fontWeight: FontWeight.w500,
          height: 19.36.toLineHeight(16.sp),
        ),

        labelStyle: labelStyle??TextStyle(
          fontSize: 16.sp,
          color: CustomColors.gray500,
          fontWeight: FontWeight.w500,
          height: 19.36.toLineHeight(16.sp),
        ),
        border:
        border??OutlineInputBorder(borderRadius: BorderRadius.circular(17.r)),
      ),
    );
  }
}
