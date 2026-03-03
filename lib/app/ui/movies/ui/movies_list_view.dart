import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import '../controller/movies_controller.dart';

class MoviesListView extends GetView<MoviesController> {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "RED",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "",
    ];

    final List<Widget> images = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.cyan,
      ),
      Container(
        color: Colors.blue,
      ),
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
  }
}
