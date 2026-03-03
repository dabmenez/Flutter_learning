import 'package:get/get.dart';

import '../controller/movies_controller.dart';

class MoviesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesController());
  }
}
