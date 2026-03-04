import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';
import '../service/sign_service.dart';

class LoginController extends GetxController {
  final UserRepository _repository = UserRepository();
  final SignService _signService = SignService();

  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final UserModel? user = await _signService.signInWithGoogle();

    if (user == null) {
      isLoading.value = false;
      return;
    }

    await _saveUser(user);
    goToHomePage();
  }

  Future<void> _saveUser(UserModel user) async {
    final existingUser = await _repository.getUser(user.id!);

    if (existingUser == null) {
      await _repository.addUser(user);
    }
  }

  void goToHomePage() {
    Get.offAllNamed(Routes.home);
  }
}
