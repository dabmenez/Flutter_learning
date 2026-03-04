import 'package:get/get.dart';

import 'home_controller.dart';
import '../movies/controller/movies_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => MoviesController());
  }
}
