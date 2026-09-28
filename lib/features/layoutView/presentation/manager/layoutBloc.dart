import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/Di/SettingDi.dart';
import '../../datalayer/Models/ProductModel.dart';
import '../../domain/UseCases/getAllCategoriesUsecase.dart';
import '../../domain/UseCases/getAllProductsUsecase.dart';

part 'layoutEvent.dart';
part 'layoutState.dart';

class Layoutbloc extends Bloc<LayoutEvent, LayoutState> {
  final GetAllProductsUsecase _getAllProductsUsecase;

  final GetAllCategoriesUsecase _getCategoriesUsecase;

  Layoutbloc()
    : _getAllProductsUsecase = getit<GetAllProductsUsecase>(),
      _getCategoriesUsecase = getit<GetAllCategoriesUsecase>(),
      super(LayoutLoading()) {
    on<getProductEvent>(_getAllProoducts);
    on<getCategoriesEvent>(_getAllCategories);
  }

  Future<void> _getAllProoducts(
    getProductEvent event,
    Emitter<LayoutState> emit,
  ) async {
    emit(LayoutLoading());

    try {
      final res = await _getAllProductsUsecase.call(event.category);

      emit(LayoutSuccessProducts(res));
    } catch (error) {
      emit(LayoutError(error.toString()));
    }
  }

  Future<void> _getAllCategories(
    getCategoriesEvent event,
    Emitter<LayoutState> emit,
  ) async {
    print("GetAllCategoriesssssssssssssssss");

    emit(LayoutLoading());

    try {
      final res = await _getCategoriesUsecase.call();

      emit(LayoutSuccessCategories(res));
    } catch (error) {
      emit(LayoutError(error.toString()));
    }
  }
}
