import "package:bloc_test/bloc_test.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";
import "package:shared/shared.dart";
import "package:wardrobe/wardrobe.dart";

import "../mocks.dart";

void main() {
  late LoadClothesOfUserUseCase useCase;

  setUp(() {
    useCase = MockLoadClothesOfUserUseCase();
  });

  group("ClothingCubit", () {
    group("Initial state", () {
      test("should be a ClothingInitial", () {
        final ClothingCubit cubit = ClothingCubit(useCase);

        expect(cubit.state, isA<ClothingInitial>());
      });
    });

    group("fetch()", () {
      blocTest<ClothingCubit, ClothingState>(
        "Success: should emit a ClothingLoaded with a list of Clothing",
        build: () => ClothingCubit(useCase),
        act: (ClothingCubit cubit) => cubit.fetch(),
        setUp: () {
          when(() => useCase.execute()).thenAnswer(
            (Invocation e) async => List<Clothing>.generate(
              4,
              (int index) => Clothing.create(
                name: "name",
                userId: ObjectId(),
                type: ClothingType.shirt,
                color: "white",
              ),
            ),
          );
        },
        expect: () => <TypeMatcher<ClothingState>>[
          isA<ClothingLoading>(),
          isA<ClothingLoaded>(),
        ],
      );
    });
  });
}
