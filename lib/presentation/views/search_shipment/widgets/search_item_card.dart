import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../styles/__export__.dart';

class SearchItemCard extends StatelessWidget {
  const SearchItemCard({super.key,
  required this.label,required this.description});
  final String label,description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(
          color: CustomColors.gray800,
          width: 1
        ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width:36.w,
            height: 36.h,
            decoration:const BoxDecoration(
                color: CustomColors.deepPurple,
                shape: BoxShape.circle
            ),
            child: Center(
              child: SvgPicture.asset("ic_box".svg),
            ),
          ),
          XMargin(15.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 label,
                  style: CustomStyle.textStyleInter.copyWith(
                      color: CustomColors.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: 19.36.toLineHeight(16.sp)
                  ),
                ),
                YMargin(4.h),
                Text(
                  description,
                  style: CustomStyle.textStyleInter.copyWith(
                      color: CustomColors.gray500,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      height: 15.73.toLineHeight(15.sp)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
