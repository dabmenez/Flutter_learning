import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class MoviesController extends GetxController {
  Map<String, String> movieForm = {
    'title': '',
    'description': '',
    'directors': '',
    'synopsis': '',
    'image': '',
  };

  void addNewMovie() {
    Get.toNamed(Routes.movieForm);
  }
}
