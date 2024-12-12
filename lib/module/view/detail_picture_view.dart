// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPictureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pictureDetail = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Detail Gambar')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(pictureDetail['download_url']),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Author: ${pictureDetail['author']}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
          ],
        ),
      ),
    );
  }
}
