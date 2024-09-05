import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/app.dart';
import 'package:moniepoin_shipment/utils/locator.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
   Animate.restartOnHotReload = true;

  await Future.delayed(Duration(seconds: 5));
  runApp(const ProviderScope(child:MyApp()));
}




