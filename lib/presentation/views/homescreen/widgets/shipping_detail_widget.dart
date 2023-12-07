import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../custom_designs/custom_margins.dart';
import '../../../styles/__export__.dart';
import '__export__.dart';
import 'custom_divider.dart';

class ShippingDetailWidget extends StatelessWidget {
  const ShippingDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: CustomColors.blackColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0,3)
            )
          ]
      ),
      padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 16.h,bottom: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YMargin(20.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipment Number',
                      style: CustomStyle.textStyleInter.copyWith(
                          color: CustomColors.gray500,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 16.94.toLineHeight(14.sp)
                      ),
                    ),
                    YMargin(8.h),
                    Text(
                      'NEJ20089934122231',
                      style: CustomStyle.textStyleInter.copyWith(
                          color: CustomColors.blackColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: 21.78.toLineHeight(18.sp)
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset("ic_tracktor".png)
            ],
          ),
          const CustomDivider(dividerColor: CustomColors.gray800).paddingOnly(top: 20.h,bottom: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularColoredContainer(
                      bgColor:CustomColors.lightPeachColor,
                      height: 40.h,width: 49.w,
                      child:Image.asset("ic_box_sender".png),),
                    XMargin(8.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sender',
                            style: CustomStyle.textStyleInter.copyWith(
                                color: CustomColors.gray500,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                height: 16.94.toLineHeight(14.sp)
                            ),
                          ),
                          YMargin(4.h),
                          Text(
                            'Atlanta, 5243',
                            style: CustomStyle.textStyleInter.copyWith(
                                color: CustomColors.blackColor,
                                fontSize: 16.sp,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                height: 19.36.toLineHeight(16.sp)
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              XMargin(20.w),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.gray500,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: 16.94.toLineHeight(14.sp)
                    ),
                  ),
                  YMargin(4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: const BoxDecoration(
                            color: CustomColors.greenColor69,
                            shape: BoxShape.circle
                        ),
                      ),
                      XMargin(5.5.w),
                      Text(
                        '2 - 3 days',
                        style: CustomStyle.textStyleInter.copyWith(
                            color: CustomColors.blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 19.36.toLineHeight(16.sp)
                        ),
                      )
                    ],
                  )
                ],
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularColoredContainer(
                      bgColor:CustomColors.lightPeachColor,
                      height: 40.h,width: 49.w,
                      child:Image.asset("ic_box_receiver".png),),
                    XMargin(8.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Receiver',
                          style: CustomStyle.textStyleInter.copyWith(
                              color: CustomColors.gray500,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 16.94.toLineHeight(14.sp)
                          ),
                        ),
                        YMargin(4.h),
                        Text(
                          'Chicago, 6342',
                          style: CustomStyle.textStyleInter.copyWith(
                              color: CustomColors.blackColor,
                              fontSize: 16.sp,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              height: 19.36.toLineHeight(16.sp)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.gray500,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: 16.94.toLineHeight(14.sp)
                    ),
                  ),
                  YMargin(4.h),
                  Text(
                    'Waiting to collect',
                    style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 19.36.toLineHeight(16.sp)
                    ),
                  )
                ],
              ))
            ],
          ).paddingOnly(top: 16.h),
          const CustomDivider(dividerColor: CustomColors.gray800).paddingSymmetric(vertical: 16.h),
          SizedBox(
            width: 1.sw,
            height: 32.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add,
                  color:CustomColors.orangeColor71,),
                XMargin(2.5),
                Text(
                  'Add Stop',
                  style: CustomStyle.textStyleInter.copyWith(
                      color: CustomColors.orangeColor71,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 19.36.toLineHeight(16.sp)
                  ),
                )
              ],
            ),
          ),
          YMargin(5.h)
        ],
      ),
    );
  }
}
