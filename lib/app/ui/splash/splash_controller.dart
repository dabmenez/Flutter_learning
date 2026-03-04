import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  bool isSignedIn = false;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    isLoading.value = true;

    _checkIfSignedIn();

    await Future.delayed(const Duration(seconds: 5));

    isLoading.value = false;
    finishLoading();
  }

  void _checkIfSignedIn() {
    isSignedIn = _firebaseAuth.currentUser != null;
  }

  void finishLoading() {
    Future.microtask(() {
      if (isSignedIn) {
        goToHomePage();
      } else {
        goToLoginPage();
      }
    });
  }

  void goToHomePage() {
    Get.offAllNamed(Routes.home);
  }

  void goToLoginPage() {
    Get.offAllNamed(Routes.login);
  }
}
