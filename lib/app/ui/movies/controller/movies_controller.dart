import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_routes.dart';
import '../model/movie.dart';
import '../repository/movie_repository.dart';
import '../service/image_service.dart';

class MoviesController extends GetxController {
  final MovieRepository _repository = MovieRepository();
  final ImageService _imageService = ImageService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ImagePicker picker = ImagePicker();
  final ValueNotifier<XFile?> imageNotifier = ValueNotifier<XFile?>(null);

  RxList<Movie> movies = <Movie>[].obs;
  RxBool isLoading = false.obs;
  RxBool isProcessingImage = false.obs;

  Map<String, String> movieForm = {
    'title': '',
    'description': '',
    'directors': '',
    'synopsis': '',
    'imageBase64': '',
  };

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  Future<void> loadMovies() async {
    isLoading.value = true;
    try {
      final result = await _repository.getAllMovies();
      movies.assignAll(result);
    } catch (e) {
      print('Erro ao carregar filmes: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveMovie() async {
    final movie = Movie(
      title: movieForm['title'] ?? '',
      description: movieForm['description'] ?? '',
      directors: movieForm['directors'] ?? '',
      synopsis: movieForm['synopsis'] ?? '',
      imageBase64: movieForm['imageBase64'] ?? '',
      createdBy: _firebaseAuth.currentUser?.uid ?? '',
    );
    await _repository.addMovie(movie);
    await loadMovies();
  }

  void addNewMovie() {
    Get.toNamed(Routes.movieForm);
  }

  Future<void> pickImage() async {
    try {
      isProcessingImage.value = true;
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageNotifier.value = image;
        final String base64 = await _imageService.compressAndEncode(image.path);
        movieForm['imageBase64'] = base64;
      }
    } catch (e) {
      print('Erro ao selecionar imagem: $e');
    } finally {
      isProcessingImage.value = false;
    }
  }
}
