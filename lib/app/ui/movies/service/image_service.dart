import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageService {
  Future<String> compressAndEncode(String imagePath) async {
    final file = File(imagePath);
    if (!await file.exists()) {
      return '';
    }

    final Uint8List? compressedBytes =
        await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 400,
      minHeight: 400,
      quality: 50,
    );

    if (compressedBytes == null) {
      return '';
    }

    return base64Encode(compressedBytes);
  }

  Uint8List decode(String base64String) {
    return base64Decode(base64String);
  }
}
