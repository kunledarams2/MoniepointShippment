import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../../utils/locator.dart';
import '../../../custom_designs/custom_text_field.dart';
import '../../../routes/__export__.dart';
import '../../../styles/__export__.dart';
import '../../../view_model/__export__.dart';

class SearchHeader extends HookConsumerWidget {
  const SearchHeader({super.key,
  this.onChange});
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final useShipmentViewModel = ref.watch(shipmentVMProvider);
    return SafeArea(top: false,child:
    Container(
      width: 1.sw,
      height: 140.h,
      color: CustomColors.darkPurple,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YMargin(60.h),
          SizedBox(
            width: 1.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                XMargin(16.w),
                IconButton(onPressed: (){
                  useShipmentViewModel.selectedDashBoardTab=useShipmentViewModel.dashBoardTabsData[0];
                  locator<AppRouter>().back();
                }, icon: SvgPicture.asset("ic_arrow_left".svg),
                  padding: EdgeInsets.zero,
                  iconSize: 40.0,
                  constraints: const BoxConstraints(),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
                  ),),
                XMargin(12.w),
                Expanded(child: CustomTextField(labelText: "Search",onChange:onChange,textStyle:CustomStyle.textStyleInter.copyWith(
                  color: CustomColors.blackColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ))),
                XMargin(16.w)
              ],
            ),
          ).animate(effects: [
            FadeEffect(
                duration: 1000.ms
            ),
            const SlideEffect(
              duration: Duration(
                  milliseconds: 1000),
              curve: Curves.easeIn,
              begin: Offset(0, 0.5),
              end: Offset(0, 0),),
          ]),
        ],
      ),
    ),);
  }
}
