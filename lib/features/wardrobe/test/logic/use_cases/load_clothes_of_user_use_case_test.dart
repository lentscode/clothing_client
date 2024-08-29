import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:shared/shared.dart";
import "package:wardrobe/wardrobe.dart";

import "../../mocks.dart";

void main() {
  late ClothingDataSource clothingDataSource;

  setUp(() {
    clothingDataSource = MockClothingDataSource();
  });

  group("LoadClothingOfUserUseCase", () {
    group("execute()", () {
      test("Success: returns a list of clothes", () async {
        when(() => clothingDataSource.getClothingsOfUser())
            .thenAnswer((_) async => List.generate(
                  3,
                  (int index) => Clothing.create(
                      name: "name",
                      userId: ObjectId(),
                      type: ClothingType.shirt,
                      color: "White"),
                ));

        final LoadClothesOfUserUseCase useCase =
            LoadClothesOfUserUseCase(clothingDataSource);

        final List<Clothing> result = await useCase.execute();

        expect(result, isA<List<Clothing>>());
      });

      test("Failure: should rethrow an Exception", () async {
        when(() => clothingDataSource.getClothingsOfUser())
            .thenThrow(Exception());

        final LoadClothesOfUserUseCase useCase =
            LoadClothesOfUserUseCase(clothingDataSource);

        expect(() async => await useCase.execute(), throwsException);
      });
    });
  });
}
