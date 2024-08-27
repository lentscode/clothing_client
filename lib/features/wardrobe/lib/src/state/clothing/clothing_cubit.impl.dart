part of "clothing_cubit.dart";

class _ClothingCubitImpl extends ClothingCubit {
  _ClothingCubitImpl(super._loadClothingsOfUserUseCase) : super._();

  @override
  Future<void> fetch() async {
    try {
      final List<Clothing> clothings =
          await _loadClothingsOfUserUseCase.execute();

      emit(ClothingLoaded(clothings));
    } on Exception catch (e) {
      emit(ClothingError(e.toString()));
    }
  }
}
