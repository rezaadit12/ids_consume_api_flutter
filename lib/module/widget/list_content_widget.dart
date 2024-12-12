// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsumapiids/core.dart';
import 'package:konsumapiids/service/picture/picture_service.dart';

class ListContentPicture extends StatelessWidget {
  final controller = Get.put(ListPictureController());
  final PictureService pictureService = PictureService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Gambar')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.pictures.length,
          itemBuilder: (context, index) {
            final picture = controller.pictures[index];
            return GestureDetector(
              onTap: () async {
                try {
                  final pictureDetail =
                      await pictureService.fetchPictureDetail(int.parse(picture['id']));
                  Get.toNamed(
                    Routes.DETAIL,
                    arguments: pictureDetail,
                  );
                } catch (e) {
                  Get.snackbar(
                    'Error',
                    'Failed to load picture details',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                      child: Image.network(
                        picture['download_url'],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        picture['author'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
