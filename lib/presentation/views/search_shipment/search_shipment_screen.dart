import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/views/search_shipment/widgets/list_container.dart';
import 'package:moniepoin_shipment/presentation/views/search_shipment/widgets/search_header.dart';
import 'package:moniepoin_shipment/presentation/views/search_shipment/widgets/search_item_card.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../custom_designs/base_scaffold.dart';
import '../../custom_designs/custom_margins.dart';
import '../../styles/__export__.dart';
import '../../view_model/__export__.dart';
@RoutePage(name: 'SearchShipmentScreen')
class SearchShipmentScreen extends HookConsumerWidget {
  const SearchShipmentScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
                const SearchHeader(),
                YMargin(24.h),
                Flexible(
                  child: ListContainer(
                    height: 1.sw*(8/6),
                    child: ListView.builder(itemBuilder: (context,index){
                      return const SearchItemCard();
                    },itemCount: 8,padding: EdgeInsets.all(0),shrinkWrap: true,),
                  ).paddingSymmetric(horizontal: 16.w),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
