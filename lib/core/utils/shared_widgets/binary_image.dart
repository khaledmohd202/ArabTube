import 'dart:convert'; // For base64 decoding
import 'dart:typed_data';

import 'package:flutter/material.dart';

class BinaryImageDisplay extends StatelessWidget {
  const BinaryImageDisplay({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    // Example base64-encoded string (this should be replaced with your actual encoded string)
    String base64Image = image;
    Uint8List imageData = base64Decode(base64Image);

    return Image.memory(imageData, fit: BoxFit.fill,
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width,);
  }
}