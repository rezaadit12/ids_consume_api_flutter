import 'package:get/get.dart';
import 'package:konsumapiids/core.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.PHOTOS,
      page: () => ListPictureView(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailPictureView(),
      binding: PictureBinding(),
    ),
  ];
}
