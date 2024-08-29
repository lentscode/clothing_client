part of "../logic.dart";

/// Single-responsibility class that fetches clothes of the user.
class LoadClothesOfUserUseCase {
  /// Returns an instance of [LoadClothesOfUserUseCase].
  const LoadClothesOfUserUseCase(this._clothingDataSource);

  final ClothingDataSource _clothingDataSource;

  /// Returns a list of clothes of the user.
  Future<List<Clothing>> execute() async {
    try {
      return _clothingDataSource.getClothingsOfUser();
    } catch (e) {
      rethrow;
    }
  }
}
