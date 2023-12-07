import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_button.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/presentation/views/calculator_screen/widgets/categories_card.dart';
import 'package:moniepoin_shipment/presentation/views/search_shipment/widgets/list_container.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../utils/locator.dart';
import '../../custom_designs/custom_text_field.dart';
import '../../routes/__export__.dart';
import '../../styles/__export__.dart';
import '../../view_model/shipment_viewmodel.dart';
import '../homescreen/widgets/home_header.dart';
import 'widgets/__export__.dart';

class CalculatorScreen extends HookConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final useShipmentViewModel = ref.watch(shipmentVMProvider);
    final controller = useAnimationController(
      duration: Duration(milliseconds: 200),
    );
    final scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(controller);
    void onTapDown(TapDownDetails details) {
      controller.forward();
    }
    void onTapUp(TapUpDetails details) {
      controller.reverse();
    }
    void onTapCancel() {
      controller.reverse();
      locator<AppRouter>().navigate(const CalculateSuccessScreen());
    }
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
                const CalculatorScreenHeader(),
                110.h,
                110.h)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: SliverList(delegate: SliverChildListDelegate(
              [
                YMargin(24.h),
                Text(
                  "Destination",
                  style: CustomStyle.textStyleInter.copyWith(
                    color: CustomColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    height: 24.2.toLineHeight(20.sp),
                  ),
                ),
                YMargin(32.h),
                ListContainer(height: 220.h, child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(labelText: "Sender location",
                      labelStyle:CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.gray500,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 19.36.toLineHeight(16.sp),
                      ),
                      textStyle:CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: SvgPicture.asset("ic_square_arrow_sender".svg).paddingAll(10),
                      suffixIcon: SizedBox.shrink(),
                      fillColor: CustomColors.lightGrey,
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),).paddingOnly(bottom: 12.h),
                    CustomTextField(labelText: "Receiver location",
                      labelStyle:CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.gray500,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 19.36.toLineHeight(16.sp),
                      ),
                      textStyle:CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),prefixIcon: SvgPicture.asset("ic_square_arrow_receiver".svg).paddingAll(10),
                      suffixIcon: SizedBox.shrink(),
                      fillColor: CustomColors.lightGrey,
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),).paddingOnly(bottom: 12.h),
                    CustomTextField(labelText: "Approx weight",
                      labelStyle:CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.gray500,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 19.36.toLineHeight(16.sp),
                      ),
                      textStyle:CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),prefixIcon: SvgPicture.asset("ic_height_meter".svg).paddingAll(10),
                      suffixIcon: SizedBox.shrink(),
                      fillColor: CustomColors.lightGrey,
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: CustomColors.lightGrey,
                            width: 1.w,
                          )),)
                  ],
                )),
                YMargin(24.h),
                Text(
                  "Packaging",
                  style: CustomStyle.textStyleInter.copyWith(
                    color: CustomColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    height: 24.2.toLineHeight(20.sp),
                  ),
                ),
                YMargin(8.h),
                Text(
                  "What are you sending?",
                  style: CustomStyle.textStyleInter.copyWith(
                    color: CustomColors.gray500,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    height: 19.36.toLineHeight(16.sp),
                  ),
                ),
                YMargin(16.h),
                Container(
                  width: 1.sw,
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: CustomColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: CustomColors.blackColor.withOpacity(0.1),
                          blurRadius: 2,
                          offset: const Offset(0,2)
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("ic_box".svg,
                        colorFilter:const ColorFilter.mode(CustomColors.darkGray, BlendMode.srcIn),).paddingOnly(
                          left: 16.w,
                          right: 12.w
                      ),
                      Container(height: 40.h,
                        color: CustomColors.gray800,
                        width: 1,).paddingOnly(right: 12.w),
                      Expanded(
                        child: Text(
                          "Box",
                          style: CustomStyle.textStyleInter.copyWith(
                            color: CustomColors.blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 19.36.toLineHeight(16.sp),
                          ),
                        ),
                      ),
                      XMargin(12.w),
                      const Icon(Icons.keyboard_arrow_down,
                        color: CustomColors.gray500,),
                      XMargin(16.w)
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YMargin(24.h),
                    Text(
                      "Categories",
                      style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: 24.2.toLineHeight(20.sp),
                      ),
                    ),
                    YMargin(8.h),
                    Text(
                      "What are you sending?",
                      style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.gray500,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 19.36.toLineHeight(16.sp),
                      ),
                    ),
                    YMargin(16.h),
                  ],
                ).animate(effects: [
                  const SlideEffect(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      begin: Offset(0, 0.5),
                      delay: Duration(milliseconds: 300),
                      end: Offset(0, 0)
                  ),
                  FadeEffect(
                    duration: Duration(milliseconds: 300),
                    delay: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  )]),
                Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 10,
                  children:useShipmentViewModel.calculatorCategoryModelList.map((e) =>GestureDetector(
                      onTap: (){

                      },
                      child: CategoriesCard(isSelected:useShipmentViewModel.selectedCalculatorCategory.name==e.name, cardLabel: e.name,
                        calculatorCategoryModel: e,
                        onTap: (model) {
                          useShipmentViewModel.selectedCalculatorCategory=model;
                        },).animate(effects: [
                        const SlideEffect(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                            begin: Offset(0.5, 0),
                            end: Offset(0, 0)
                        ),
                        FadeEffect(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        )
                      ]))).toList(),
                ).paddingOnly(bottom: 40.h),
               GestureDetector(
                   onTapDown: onTapDown,
                   onTapUp: onTapUp,
                   onTapCancel: onTapCancel,
                   child: AnimatedBuilder(
                       animation: scaleAnimation, builder: (BuildContext context, Widget? child) {
                     return Transform.scale(
                       scale: scaleAnimation.value,
                       child: CustomButton().paddingOnly(bottom: 32.h),
                     );
                   },))
              ]
          )),
        )
      ],
    );
  }
}
