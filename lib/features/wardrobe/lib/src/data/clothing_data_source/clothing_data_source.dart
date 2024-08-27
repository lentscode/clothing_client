import "dart:convert";
import "dart:io";

import "package:auth/auth.dart";
import "package:common/common.dart";
import "package:dio/dio.dart";
import "package:shared/shared.dart";

part "clothing_data_source.impl.dart";

/// Class that works with clothing data.
abstract class ClothingDataSource {
  const ClothingDataSource._(this._dio);

  /// Creates an instance of [ClothingDataSource].
  factory ClothingDataSource(Dio dio) = _ClothingDataSourceImpl;

  final Dio _dio;

  /// Returns a list of clothing items of the user from the DB.
  Future<List<Clothing>> getClothingsOfUser();

  /// Creates a new clothing item in the DB.
  Future<Clothing> createClothing({
    required String name,
    required String color,
    required String type,
    String? brand,
    File? image,
  });
}
