import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../models/shipping_history_model.dart';
import '../../custom_designs/base_scaffold.dart';
import '../../custom_designs/custom_margins.dart';
import '../../styles/__export__.dart';
import '../../view_model/shipment_viewmodel.dart';
import 'widgets/__export__.dart';
class ShipmentHistoryScreen extends HookConsumerWidget {
  const ShipmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var listHolder = useState<List<ShippingDatum>?>([]);

    final useShipmentViewModel = ref.watch(shipmentVMProvider);

    useEffect((){
      listHolder.value=useShipmentViewModel.selectedShippingHistory!.data;
      return null;
    },[]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const CustomTabBar(),
        Container(
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
                      if(useShipmentViewModel.shipmentHistoryTabData[index].tabName !="All"){
                        listHolder.value = useShipmentViewModel.selectedShippingHistory!.data.where((e) =>e.status ==useShipmentViewModel.shipmentHistoryTabData[index].tabName ).toList();

                      }else{
                        // useShipmentViewModel.readShippingHistoryJson();
                        listHolder.value =  useShipmentViewModel.selectedShippingHistory!.data;
                      }
                    },);
                },
                  physics: const BouncingScrollPhysics(),
                  itemCount: useShipmentViewModel.shipmentHistoryTabData.length,
                  scrollDirection: Axis.horizontal,),
              ),
            ],
          ),
        ),
        YMargin(24.h),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipments',
                style: CustomStyle.textStyleInter.copyWith(
                    color: CustomColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    height: 24.2.toLineHeight(20.sp)
                ),
              ),
              YMargin(16.h),
              Expanded(
                child:
                ListView.builder(
                  itemBuilder: (context,index){

                  return  ShipmentHistoryItemCard(shippingDatum: listHolder.value![index]/*useShipmentViewModel.selectedShippingHistory!.data[index]*/, ).animate(effects: [
                    const FadeEffect(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                    ) ,
                    FadeEffect(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    )
                  ]);
                },
                  itemCount:listHolder.value!.length /*useShipmentViewModel.selectedShippingHistory!.data.length*/,

                  padding: EdgeInsets.all(0),)

                /* ListView(
                  padding: const EdgeInsets.all(0),
                  physics: const BouncingScrollPhysics(),
                  children:List.generate(useShipmentViewModel.shipmentHistoryTabData.length, (index) => const ShipmentHistoryItemCard().animate(effects: [
                    const FadeEffect(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                    )
                  ])),
                )*/,
              )
            ],
          ).paddingSymmetric(horizontal: 16.w),
        )
      ],
    );
  }
}
