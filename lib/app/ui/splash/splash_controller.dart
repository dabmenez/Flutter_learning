import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 5));

    isLoading.value = false;
    finishLoading();
  }

  void finishLoading() {
    Future.microtask(() => goToHomePage());
  }

  void goToHomePage() {
    Get.offAllNamed(Routes.home);
  }
}
