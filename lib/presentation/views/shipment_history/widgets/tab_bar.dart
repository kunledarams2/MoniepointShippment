import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';
import '../../../../models/shipment_tab_data_model/shipment_history_tab_data_model.dart';
import '../../../../models/shipping_history_model.dart';
import '../../../styles/__export__.dart';
import '../../../view_model/__export__.dart';

class CustomTabBar extends HookConsumerWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var selectedTab = useState<int>(-1);
  final useShipmentViewModel = ref.watch(shipmentVMProvider);
    var listHolder = useState<List<ShippingDatum>?>([]);

    useEffect((){
      listHolder.value=useShipmentViewModel.selectedShippingHistory!.data;
      return null;
    },[]);

    return SafeArea(
      top: false,
      child: Container(
        width: 1.sw,
        height: 150.h,
        color: CustomColors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    useShipmentViewModel.navigateBack();
                  },
                    child: SvgPicture.asset("ic_arrow_left".svg)),
                Spacer(),
                Text(
                  'Shipment history',
                  textAlign: TextAlign.center,
                  style: CustomStyle.textStyleInter.copyWith(
                      color: CustomColors.whiteColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 21.78.toLineHeight(18.sp)
                  ),
                ),
                Spacer(),
                // Expanded(
                //   child:
                // )
              ],
            ).paddingOnly(top: 28.h,left: 16.w, right: 16.w),
            SizedBox(
              width: 1.sw,
              height:60.h,
              child: ListView.builder(itemBuilder: (context,index){
                return TabCu(isSelected: useShipmentViewModel.selectedShipmentTab.tabName==useShipmentViewModel.shipmentHistoryTabData[index].tabName,
                  shipmentTab: useShipmentViewModel.shipmentHistoryTabData[index], tabLabel:useShipmentViewModel.shipmentHistoryTabData[index].tabName,
                  itemCount:useShipmentViewModel.calculateTotalForStatus(useShipmentViewModel.selectedShippingHistory!.data,useShipmentViewModel.shipmentHistoryTabData[index].tabName ).toString() /*((index+1)*2).toString()*/,
                  onTap: (tabModel) {
                    useShipmentViewModel.selectedShipmentTab=tabModel;
                    listHolder.value = useShipmentViewModel.selectedShippingHistory!.data.where((e) =>e.status ==useShipmentViewModel.shipmentHistoryTabData[index].tabName ).toList();
                  },);
              },
                physics: const BouncingScrollPhysics(),
              itemCount: useShipmentViewModel.shipmentHistoryTabData.length,
              scrollDirection: Axis.horizontal,),
            ),
          ],
        ),
      ),
    );
  }
}

class TabCu extends StatelessWidget {
  final bool isSelected;
  final String tabLabel;
  final String itemCount;
  final Function(ShipmentHistoryTabModel) onTap;
  final ShipmentHistoryTabModel shipmentTab;
  const TabCu({super.key, required this.isSelected, required this.tabLabel,
  required this.itemCount,
  required this.onTap,
  required this.shipmentTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(shipmentTab);
      },
      child: Container(
        height: 56.h,
        padding: EdgeInsets.only(left: 16.w),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: isSelected?
          CustomColors.orangeColor71:Colors.transparent,width: 3))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tabLabel,
              style: CustomStyle.textStyleInter.copyWith(
                  color: isSelected
                      ? CustomColors.whiteColor
                      : CustomColors.lightPurple,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: 19.36.toLineHeight(16.sp)),
            ),
            XMargin(4.w),
            Container(
              width: 31.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected?CustomColors.orangeColor71:CustomColors.lightPurple200
              ),
              child: Center(
                child:Text(
                  itemCount,
                  style: CustomStyle.textStyleInter.copyWith(
                      color: isSelected
                          ? CustomColors.whiteColor
                          : CustomColors.lightPurple,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
