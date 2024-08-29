part of "clothing_cubit.dart";

@immutable
sealed class ClothingState {}

final class ClothingInitial extends ClothingState {}

final class ClothingLoading extends ClothingState {}

final class ClothingLoaded extends ClothingState {
  ClothingLoaded(this.clothes);

  final List<Clothing> clothes;
}

final class ClothingError extends ClothingState {
  ClothingError(this.error);

  final Exception error;
}
