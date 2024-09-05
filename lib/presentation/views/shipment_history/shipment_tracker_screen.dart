import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/views/shipment_history/shipment_history_screen.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../models/shipping_history_model.dart';
import '../../../utils/locator.dart';
import '../../custom_designs/base_scaffold.dart';
import '../../styles/custom_colors.dart';
import '../../styles/custom_style.dart';
import '../../view_model/shipment_viewmodel.dart';
import '../../routes/__export__.dart';

@RoutePage(name: 'ShipmentTrackerScreen')
class ShipmentTrackerScreen extends HookConsumerWidget {
  const ShipmentTrackerScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var listHolder = useState<List<ShippingDatum>?>([]);

    final useShipmentViewModel = ref.watch(shipmentVMProvider);

    useEffect((){
      listHolder.value=useShipmentViewModel.selectedShippingHistory!.data;
      return null;
    },[]);
    return  BaseScaffold(
      includeHorizontalPadding: false,
      backgroundColor:Color(0XFFDF3EEFF),
      childHasCustomHeader: false,
      safeTop: false,
      onWillPop: () {},
      builder: (size) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor:Color(0XFFE0EEFF),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: CustomColors.gray900,
            systemNavigationBarIconBrightness: Brightness.dark,

          ),
          child: Stack(children: [
            Positioned(
              top: 50,
              child: SizedBox(
                height: 0.9.sw,
                child: Image.asset(
                  'assets/images/map_image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: (){
                    useShipmentViewModel.selectedDashBoardTab=useShipmentViewModel.dashBoardTabsData[2];
                    locator<AppRouter>().back();

                  },
                  child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                                ),
                                child: Icon(Icons.navigate_before, color: Colors.black,),
                              ),
                )),
            Positioned(
              top: 1.sw,
              // left: 20,
              // right: 20,
              bottom: 0,
              child:   Container(
                height: 1.sw,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                    Text("Estimated Time",
                      style: CustomStyle.textStyleInter.copyWith(
                          color: CustomColors.gray500,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 24.2.toLineHeight(20.sp)
                      ),),
                    RichText(text: TextSpan( text: "09:30", style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: 24.2.toLineHeight(20.sp)), children: [TextSpan(
                      text: "PM",
                        style: CustomStyle.textStyleInter.copyWith(
                            color: CustomColors.blackColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            height: 14.2.toLineHeight(12.sp))
                    )])),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColors.gray800.withOpacity(0.5)
                      ),
                      child: Row(children: [
                        Image.asset("assets/images/ic_cargo_freight.png", height: 60,width: 60,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text("Arriving today!",
                                      style: CustomStyle.textStyleInter.copyWith(
                                          color: CustomColors.blackColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 14.2.toLineHeight(12.sp))),
                              SizedBox(width:40,),
                                  Text("Feb 23 at 9:50 pm",
                                      style: CustomStyle.textStyleInter.copyWith(
                                          color: CustomColors.gray500,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 14.2.toLineHeight(12.sp)))
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text("Your delivery, #N34673TYHS89008, from Atlanta, is arriving today",
                                  style: CustomStyle.textStyleInter.copyWith(
                                      color: CustomColors.gray500,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 14.2.toLineHeight(12.sp)))
                            ],),
                          ),
                        )
                      ],),
                    ),
                      // SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(Icons.more_vert, color: CustomColors.gray500,size: 30,weight: 2,),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                        ),
                        child: Row(children: [
                          Image.asset("assets/images/ic_ocean_freight.png", height: 60,width: 60,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text("Has been Shipped",
                                          style: CustomStyle.textStyleInter.copyWith(
                                              color: CustomColors.blackColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              height: 14.2.toLineHeight(12.sp))),
                                 Spacer(),
                                      Text("Feb 20",
                                          style: CustomStyle.textStyleInter.copyWith(
                                              color: CustomColors.gray500,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              height: 14.2.toLineHeight(12.sp)))
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text("The parcel is waiting for collection",
                                      style: CustomStyle.textStyleInter.copyWith(
                                          color: CustomColors.gray500,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 14.2.toLineHeight(12.sp)))
                                ],),
                            ),
                          )
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(Icons.more_vert, color: CustomColors.gray500,size: 30,weight: 2,),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                        ),
                        child: Row(children: [
                          SvgPicture.asset("ic_shipment_history_box".svg,  height: 60,width: 60,),
                          // Image.asset("assets/images/ic_cargo_freight.png", height: 60,width: 60,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text("Has been sent",
                                          style: CustomStyle.textStyleInter.copyWith(
                                              color: CustomColors.blackColor,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              height: 14.2.toLineHeight(12.sp))),
                                      Spacer(),
                                      Text("Feb 17 ",
                                          style: CustomStyle.textStyleInter.copyWith(
                                              color: CustomColors.gray500,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              height: 14.2.toLineHeight(12.sp)))
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text("The parcel is waiting for collection",
                                      style: CustomStyle.textStyleInter.copyWith(
                                          color: CustomColors.gray500,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 14.2.toLineHeight(12.sp)))
                                ],),
                            ),
                          )
                        ],),
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("ic_avatar".png),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Eve Young",
                                  style: CustomStyle.textStyleInter.copyWith(
                                      color: CustomColors.blackColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 14.2.toLineHeight(12.sp))),
                              Text("Driver",
                                style: CustomStyle.textStyleInter.copyWith(
                                    color: CustomColors.gray500,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    height: 24.2.toLineHeight(20.sp)
                                ),),

                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue,width: 2),
                              borderRadius: BorderRadius.circular(20)
                                  
                            ),
                              child: Icon(Icons.chat,size: 20, color: Colors.blue,)
                          ),

                          SizedBox(width: 20,),
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange,width: 2),
                                  borderRadius: BorderRadius.circular(20)

                              ),
                              child: Icon(Icons.call,size: 20, color: Colors.orange,)
                          ),



                        ],
                      ),


                  ],),
                ),
              ) .animate(effects: [
                FadeEffect(
                    duration: 500.ms
                ), ScaleEffect(
                    delay: 500.ms
                )
              ]),),



          ],),
        );
      },
    );
  }
}