// ignore_for_file: unnecessary_import

import 'package:get/get.dart';
import 'package:konsumapiids/core.dart';
import 'package:konsumapiids/module/controller/detail_picture_controller.dart';
import 'package:konsumapiids/module/controller/list_picture_controller.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListPictureController());
    Get.lazyPut(() => DetailPictureController());
  }
}
