import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/view_model/__export__.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../models/dashboard_tab_data_model/__export__.dart';
import '../../styles/__export__.dart';

class CustomBottomNavigationBar extends HookConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useShipmentViewModel = ref.watch(shipmentVMProvider);
    return Container(
      width: 1.sw,
      height: 99.h,
      decoration: BoxDecoration(color: CustomColors.whiteColor, boxShadow: [
        BoxShadow(
            color: CustomColors.blackColor.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3))
      ]),
      child: ListView.builder(itemBuilder: (context,index){
        return CustomNavigationBarItem(isSelected: useShipmentViewModel.selectedDashBoardTab.tabName==useShipmentViewModel.dashBoardTabsData[index].tabName,
            dashBoardTabModel:useShipmentViewModel.dashBoardTabsData[index],
            onTap: (tabData){
              useShipmentViewModel.selectedDashBoardTab=tabData;
            });
      },
      itemCount: useShipmentViewModel.dashBoardTabsData.length,
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.horizontal,),
    );
  }
}

class CustomNavigationBarItem extends HookConsumerWidget {
  const CustomNavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.onTap,
      required this.dashBoardTabModel});

  final bool isSelected;
  final Function(DashBoardTabModel) onTap;
  final DashBoardTabModel dashBoardTabModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: (){
        onTap(dashBoardTabModel);
      },
      child: Container(
        height: 83.h,
        width: 0.25.sw,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color:
                        isSelected ? CustomColors.darkPurple : Colors.transparent,
                    width: 4.h))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              dashBoardTabModel.iconUrl.svg,
              colorFilter: ColorFilter.mode(
                  isSelected ? CustomColors.darkPurple : CustomColors.gray500,
                  BlendMode.srcIn),
            ).paddingOnly(bottom: 11.h),
            Text(
              dashBoardTabModel.tabName,
              style: CustomStyle.textStyleInter.copyWith(
                  color: isSelected?CustomColors.darkPurple:CustomColors.gray500,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  height: 21.78.toLineHeight(18.sp)),
            )
          ],
        ),
      ),
    );
  }
}
