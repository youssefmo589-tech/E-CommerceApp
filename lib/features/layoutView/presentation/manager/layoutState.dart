part of 'layoutBloc.dart';

class LayoutState extends Equatable {
  @override
  List<Object> get props => [];
}

class LayoutLoading extends LayoutState {}

class LayoutError extends LayoutState {
  String error;

  LayoutError(this.error);

  @override
  List<Object> get props => [error];
}

class LayoutSuccessProducts extends LayoutState {
  final List<ProductModel> products;

  LayoutSuccessProducts(this.products);

  @override
  List<Object> get props => [products];
}

class LayoutSuccessCategories extends LayoutState {
  final List<String> categories;

  LayoutSuccessCategories(this.categories);

  @override
  List<Object> get props => [categories];
}
