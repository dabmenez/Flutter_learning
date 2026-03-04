import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import '../controller/movies_controller.dart';

class MoviesListView extends GetView<MoviesController> {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final List<String> titles = [
        ...controller.movies.map((m) => m.title),
        '',
      ];

      final List<Widget> images = [
        ...controller.movies.map((m) {
          if (m.imageBase64.isNotEmpty) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(base64Decode(m.imageBase64)),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.movie, size: 50, color: Colors.white),
              ),
            );
          }
        }),
        Container(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(36),
              ),
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ];

      return VerticalCardPager(
        titles: titles,
        images: images,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        onPageChanged: (page) {},
        onSelectedItem: (index) {
          if (index == images.length - 1) {
            controller.addNewMovie();
          }
        },
        initialPage: 0,
        align: ALIGN.CENTER,
      );
    });
  }
}
