import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoin_shipment/utils/locator.dart';

import 'presentation/routes/__export__.dart';
import 'presentation/styles/__export__.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor:  CustomColors.deepPurple, // Set your desired color
    //   statusBarIconBrightness: Brightness.light, // For white icons on a dark background
    // ));


    return ScreenUtilInit(
      designSize: const Size(390, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
          title: "",
          theme: AppTheme.defaultAppTheme,
          builder: (context, widget) {
            return Navigator(
              onGenerateRoute: (settings) => CupertinoPageRoute(
                builder: (context) => widget!,
              ),
            );
          },
        );
      },
    );
  }
}
