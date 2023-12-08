import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/views/search_shipment/widgets/list_container.dart';
import 'package:moniepoin_shipment/presentation/views/search_shipment/widgets/search_header.dart';
import 'package:moniepoin_shipment/presentation/views/search_shipment/widgets/search_item_card.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../models/search_shipment_item_model/search_shipment_item_model.dart';
import '../../custom_designs/base_scaffold.dart';
import '../../custom_designs/custom_margins.dart';
import '../../styles/__export__.dart';
import '../../view_model/__export__.dart';
@RoutePage(name: 'SearchShipmentScreen')
class SearchShipmentScreen extends HookConsumerWidget {
  const SearchShipmentScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final useShipmentViewModel = ref.watch(shipmentVMProvider);
    var listHolder = useState<List<SearchShipmentItemModel>?>([]);
    var searchQuery = useState<String>("");
    var isSearching = useState<bool>(false);
    final controller = useAnimationController(
      duration: Duration(milliseconds: 1000),
      initialValue: isSearching.value ? 1.0 : 0.0,
    );

    useEffect(() {
      if (isSearching.value) {
        controller.reset();
        controller.forward();
      } else {
        controller.reverse();
      }
      return null;
    }, [searchQuery.value]);
    useEffect((){
      listHolder.value=useShipmentViewModel.searchHistoryItems;
      return null;
    },[]);
    return BaseScaffold(
      includeHorizontalPadding: false,
      backgroundColor:CustomColors.gray900,
      childHasCustomHeader: false,
      safeTop: false,
      onWillPop: () {},
      builder: (size) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: SizedBox(
            width: 1.sw,
            height: 1.sw,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SearchHeader(onChange: (text){
                   if(text.isNotEmpty){
                     listHolder.value = useShipmentViewModel.searchHistoryItems.where((element) {
                       return element.itemName
                           .toLowerCase()
                           .contains(text.toLowerCase())||element.itemDescription
                           .toLowerCase()
                           .contains(text.toLowerCase());
                     }).toList();
                     isSearching.value=true;
                     searchQuery.value=text;
                   }else{
                     listHolder.value=useShipmentViewModel.searchHistoryItems;
                     isSearching.value=false;
                   }
                },),
                YMargin(24.h),
                if(listHolder.value!=null)...[
                  Flexible(
                    child: ListContainer(
                      height: 1.sw*(listHolder.value!.length/6),
                      child: ListView.builder(itemBuilder: (context,index){
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0.0, isSearching.value ? 1.0 : 0.0),
                            end: Offset(0.0, 0.0),
                          ).animate(controller),
                          child: FadeTransition(
                            opacity: Tween<double>(begin: isSearching.value
                                ?0.0:1.0, end: 1.0).animate(controller),
                            child: SearchItemCard(label: listHolder.value![index].itemName,
                              description:listHolder.value![index].itemDescription,),
                          ),
                        );
                      },itemCount:listHolder.value!.length,padding: EdgeInsets.all(0),shrinkWrap: true,),
                    ).paddingSymmetric(horizontal: 16.w),
                  )
                ]else ...[
                  SizedBox.shrink()
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
