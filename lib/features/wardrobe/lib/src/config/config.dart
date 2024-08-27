library;

import "package:common/common.dart";
import "package:dio/dio.dart";

import "../../wardrobe.dart";

void wardrobeConfig() {
  final ClothingDataSource clothingDataSource =
      ClothingDataSource(getIt.get<Dio>());

  getIt.registerSingleton<ClothingDataSource>(clothingDataSource);
}
