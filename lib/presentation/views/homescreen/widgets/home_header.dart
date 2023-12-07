import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_text_field.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';
import 'package:moniepoin_shipment/utils/locator.dart';

import '../../../custom_designs/custom_margins.dart';
import '../../../routes/__export__.dart';
import '../../../styles/__export__.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            SafeArea(
              top: false,
              child: Container(
                color: CustomColors.darkPurple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YMargin(60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("ic_avatar".png),
                        XMargin(16.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("ic_send".svg),
                                  XMargin(8.w),
                                  Text(
                                    'Your location',
                                    style: CustomStyle.textStyleInter.copyWith(
                                        color: CustomColors.whiteColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 19.36.toLineHeight(16.sp)),
                                  )
                                ],
                              ),
                              YMargin(5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Wertheimer, Illinois',
                                    style: CustomStyle.textStyleInter.copyWith(
                                        color: CustomColors.whiteColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 21.78.toLineHeight(18.sp)),
                                  ),
                                  XMargin(8.w),
                                  SvgPicture.asset("ic_arrow_down".svg),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.whiteColor),
                          child: Center(
                              child:
                                  SvgPicture.asset("ic_notification_bell".svg)),
                        )
                      ],
                    ).paddingOnly(left: 16.w, right: 16.w, bottom: 22.h),
                    GestureDetector(
                      onTap: (){
                        locator<AppRouter>().navigateNamed(Routes.searchShipmentScreenRoute);
                      },
                        child: const AbsorbPointer(child: CustomTextField())
                            .paddingSymmetric(horizontal: 16.w))
                  ],
                ),
              ),
            ).animate(effects: [
              const SlideEffect(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  begin: Offset(0, -1),
                  end: Offset(0, 0)),
            ]),
            190.h,
            190.h));
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget childWidget;
  final double minHeight;
  final double maxHeight;

  SliverAppBarDelegate(this.childWidget, this.minHeight, this.maxHeight);

  // @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return childWidget;
  }

  // @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }

  // @override
  double get maxExtent => maxHeight;

  // @override
  double get minExtent => minHeight;
}
