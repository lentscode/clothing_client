part of "clothing_data_source.dart";

class _ClothingDataSourceImpl extends ClothingDataSource {
  const _ClothingDataSourceImpl(super._dio) : super._();

  @override
  Future<List<Clothing>> getClothingsOfUser() async {
    final Response<String> response = await _dio.get("/protected/clothings");

    switch (response.statusCode) {
      case 200:
        if (response.data == null) {
          throw MissingBodyException();
        }
        final List<dynamic> body = jsonDecode(response.data!);

        return body
            .map((dynamic e) => Clothing.fromMap(e))
            .toList();
      case 401:
        throw UnauthenticatedException();

      default:
        throw ServerException();
    }
  }

  @override
  Future<Clothing> createClothing({
    required String name,
    required String color,
    required String type,
    String? brand,
    File? image,
  }) async {
    final FormData data = FormData.fromMap(<String, Object?>{
      "data": <String, String?>{
        "name": name,
        "color": color,
        "type": type,
        "brand": brand,
      },
      "image": image == null
          ? null
          : await MultipartFile.fromFile(
              image.path,
              filename: image.path.split("/").last,
            ),
    });

    final Response<String> response =
        await _dio.post("/protected/clothings", data: data);

    if (response.data == null) {
      throw MissingBodyException();
    }

    final dynamic body = jsonDecode(response.data!);

    return Clothing.fromMap(body);
  }
}
