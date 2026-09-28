part of 'layoutBloc.dart';

class LayoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class getProductEvent extends LayoutEvent {
  String category;

  getProductEvent(this.category);
}

class getCategoriesEvent extends LayoutEvent {}
