part of 'AuthBloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInEvent extends AuthEvent {
  String email;

  String password;

  SignInEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
