import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/__export__.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({super.key,
  required this.child,
  required this.height});
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height:height,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: CustomColors.blackColor.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0,2)
            )
          ],
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: child,
    );
  }
}
