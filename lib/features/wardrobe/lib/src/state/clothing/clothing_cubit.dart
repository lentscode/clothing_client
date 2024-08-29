import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:shared/shared.dart";

import "../../../wardrobe.dart";

part "clothing_cubit.impl.dart";
part "clothing_state.dart";

abstract class ClothingCubit extends Cubit<ClothingState> {
  ClothingCubit._(this._loadClothingsOfUserUseCase) : super(ClothingInitial());

  factory ClothingCubit(
    LoadClothesOfUserUseCase loadClothingsOfUserUseCase,
  ) = _ClothingCubitImpl;

  final LoadClothesOfUserUseCase _loadClothingsOfUserUseCase;

  Future<void> fetch();
}
