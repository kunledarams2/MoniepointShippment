import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/presentation/styles/__export__.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../../models/calculator_category_model/calculator_category_model.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key,
  required this.isSelected,
  required this.cardLabel,
  required this.calculatorCategoryModel,
  required this.onTap});
  final bool isSelected;
  final CalculatorCategoryModel calculatorCategoryModel;
  final Function(CalculatorCategoryModel)onTap;
  final String cardLabel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(calculatorCategoryModel);
      },
      child: Container(
        width:isSelected?1.sw*(cardLabel.length/24):1.sw*(cardLabel.length/30),
        margin: EdgeInsets.only(right: 12.w),
        height: 39.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
            color: isSelected?CustomColors.darkTealColor:CustomColors.whiteColor,
          border: Border.all(color: CustomColors.darkCharcoalGray,width: 1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(isSelected)...[
              const Icon(Icons.check,color: CustomColors.whiteColor,size: 20,),
              XMargin(5.w),
            ],
            Flexible(
              child: Text(
               cardLabel,
                style: CustomStyle.textStyleInter.copyWith(
                  color: isSelected?CustomColors.whiteColor:CustomColors.darkCharcoalGray,
                  fontSize: 19.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  height: 19.36.toLineHeight(19.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
