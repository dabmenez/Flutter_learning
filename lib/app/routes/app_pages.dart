import 'package:get/get.dart';

import '../ui/splash/splash_page.dart';
import '../ui/splash/splash_bindings.dart';
import '../ui/dashboard/home_page.dart';
import '../ui/dashboard/home_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomePageBindings(),
    ),
  ];
}
