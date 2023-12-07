
import 'package:get_it/get_it.dart';

import '../presentation/routes/__export__.dart';
GetIt locator = GetIt.instance;

Future<void> setupLocator() async {

  //Register App Router
  final appRouter = AppRouter();
  locator.registerSingleton(appRouter);

}
