import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../styles/__export__.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    required this.onTap,
  this.height, this.width,
  this.bgColor,
  this.buttonStyle,
  this.buttonLabel,
  this.borderRadius,});
final double? height,width,borderRadius;
final Color? bgColor;
final TextStyle? buttonStyle;
final String? buttonLabel;
final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        width: width??1.sw,
        height: height??49.h,
        decoration: BoxDecoration(
          color: bgColor??CustomColors.orangeColor71,
              borderRadius: BorderRadius.circular(borderRadius??25.r)
        ),
        child: Center(
          child: Text(
            buttonLabel??"Calculate",
            style: buttonStyle??CustomStyle.textStyleInter.copyWith(
              color: CustomColors.whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 19.36.toLineHeight(16.sp),
            ),
          ),
        ),
      ),
    );
  }
}
