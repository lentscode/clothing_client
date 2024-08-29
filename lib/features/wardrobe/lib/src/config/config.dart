library;

import "package:common/common.dart";
import "package:dio/dio.dart";

import "../../wardrobe.dart";

/// Sets services for the `wardrobe` library inside [getIt].
void wardrobeConfig() {
  final ClothingDataSource clothingDataSource =
      ClothingDataSource(getIt.get<Dio>());

  getIt.registerSingleton<ClothingDataSource>(clothingDataSource);
}
