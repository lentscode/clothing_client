import "package:auth/auth.dart";
import "package:common/common.dart";
import "package:dio/dio.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http_mock_adapter/http_mock_adapter.dart";
import "package:http_mock_adapter/src/handlers/request_handler.dart";
import "package:shared/shared.dart";
import "package:wardrobe/src/data/clothing_data_source/clothing_data_source.dart";

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions(validateStatus: (_) => true,));
    dioAdapter = DioAdapter(dio: dio);
  });

  tearDown(() {
    dio.close();
    dioAdapter.close();
  });

  group("ClothingDataSource", () {
    group("getClothingsOfUser()", () {
      test("Success: returns a list of clothings", () async {
        final List<Map<String, dynamic>> clothings =
            List<Map<String, dynamic>>.generate(
          5,
          (int index) => <String, dynamic>{
            "_id": ObjectId().oid,
            "userId": ObjectId().oid,
            "name": "Shirt",
            "color": "Red",
            "type": "shirt",
            "lastUpdate": DateTime.now().toIso8601String(),
            "imageUrl": null,
            "imageExpiration": null,
          },
        );
        dioAdapter.onGet(
          "/protected/clothings",
          (MockServer e) => e.reply(200, clothings),
        );

        final ClothingDataSource dataSource = ClothingDataSource(dio);

        final List<Clothing> result = await dataSource.getClothingsOfUser();

        expect(result.length, 5);
      });

      test("Failure: on 401 response should throw an UnauthenticatedException",
          () {
        dioAdapter.onGet(
          "/protected/clothings",
          (MockServer e) => e.reply(401, null),
        );

        final ClothingDataSource dataSource = ClothingDataSource(dio);

        expect(dataSource.getClothingsOfUser(), throwsA(isA<UnauthenticatedException>()));
      });

      test("Failure: on any other response should throw a ServerException", () {
        dioAdapter.onGet(
          "/protected/clothings",
          (MockServer e) => e.reply(500, null),
        );

        final ClothingDataSource dataSource = ClothingDataSource(dio);

        expect(dataSource.getClothingsOfUser(), throwsA(isA<ServerException>()));
      });
    });
  });
}
