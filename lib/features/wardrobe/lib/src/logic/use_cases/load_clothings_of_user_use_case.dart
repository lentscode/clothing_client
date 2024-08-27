part of "../logic.dart";

class LoadClothingsOfUserUseCase {
  const LoadClothingsOfUserUseCase(this._clothingDataSource);

  final ClothingDataSource _clothingDataSource;

  Future<List<Clothing>> execute() async {
    try {
      return _clothingDataSource.getClothingsOfUser();
    } catch (e) {
      rethrow;
    }
  }
}
