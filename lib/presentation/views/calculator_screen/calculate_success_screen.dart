import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_button.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../utils/locator.dart';
import '../../custom_designs/base_scaffold.dart';
import '../../routes/__export__.dart';
import '../../styles/__export__.dart';
import '../../view_model/__export__.dart';
@RoutePage(name: 'CalculateSuccessScreen')
class CalculateSuccessScreen extends HookConsumerWidget {
  const CalculateSuccessScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final useShipmentViewModel = ref.watch(shipmentVMProvider);
    final controller = useAnimationController(
      duration: Duration(milliseconds: 200),
    );
    final scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(controller);
    final moneyAnimationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    final animation = IntTween(begin: 0, end: 1441).animate(moneyAnimationController);
    useEffect(() {
      moneyAnimationController.forward();
      return null;
    }, const []);
    void onTapDown(TapDownDetails details) {
      controller.forward();
    }
    void onTapUp(TapUpDetails details) {
      controller.reverse();
    }
    void onTapCancel() {
      controller.reverse();
      useShipmentViewModel.selectedDashBoardTab=useShipmentViewModel.dashBoardTabsData[0];
      locator<AppRouter>().back();
    }
    return BaseScaffold(
      includeHorizontalPadding: false,
      backgroundColor:CustomColors.gray900,
      childHasCustomHeader: false,
      safeTop: false,
      onWillPop: () {},
      builder: (size) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: SizedBox(
            width: 1.sw,
            height: 1.sw,
            child:Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("img_movemate".png),
                        XMargin(6.w),
                        SvgPicture.asset("ic_movemate_truck".svg)
                      ],
                    ),
                  YMargin(56.21.h),
                  SvgPicture.asset("ic_movemate_box".svg).animate(effects: [
                    ScaleEffect(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      begin: Offset(0.3,0.3),
                      end: Offset(1,1)
                    )
                  ]),
                  YMargin(10.h),
                  Text(
                    "Total Estimated Amount",
                    style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w500,
                        height: 31.47.toLineHeight(16.sp)
                    ),
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
                  YMargin(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Text(
                            '\$${animation.value}',
                            style: CustomStyle.textStyleInter.copyWith(
                                color: CustomColors.greenColor69,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                      Text(
                        'USD',
                        style: CustomStyle.textStyleInter.copyWith(
                          color: CustomColors.greenColor69,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  YMargin(16.h),
                  Text(
                    "This amount is estimated, this will vary if you change your location or weight.",
                    style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.gray500,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 19.36.toLineHeight(16.sp)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  YMargin(32.h),
                  GestureDetector(
                      onTapDown: onTapDown,
                      onTapUp: onTapUp,
                      onTapCancel: onTapCancel,
                      child: AnimatedBuilder(
                        animation: scaleAnimation, builder: (BuildContext context, Widget? child) {
                        return Transform.scale(
                          scale: scaleAnimation.value,
                          child: const CustomButton(
                            buttonLabel: "Back to home",
                          ).paddingOnly(bottom: 32.h),
                        );
                      },))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
