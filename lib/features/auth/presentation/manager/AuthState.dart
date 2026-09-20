part of 'AuthBloc.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthState {}

class ErrorState extends AuthState {
  final message;

  ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SuccessState extends AuthState {}
