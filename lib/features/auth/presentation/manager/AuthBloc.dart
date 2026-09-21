import 'package:ecommerce/features/auth/domain/usecases/signin-usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Di/SettingDi.dart';
import '../../domain/usecases/SignUpUsecase.dart';
import '../Models/UserModel.dart';

part 'AuthEvent.dart';
part 'AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase _signInUsecase;

  final SignUpUsecase _signUpEvent;

  AuthBloc()
      : _signInUsecase = getit<SignInUsecase>(),
        _signUpEvent = getit<SignUpUsecase>(),
        super(LoadingState()) {
    on<SignInEvent>(_onsigninevent);
    on<SignUpEvent>(_onsignupevent);
  }

  Future<void> _onsigninevent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingState());

    final result = await _signInUsecase.call(event.email, event.password);

    switch (result) {
      case true:
        emit(SuccessState());
        break;
      case false:
        emit(ErrorState(message: "something went wrong"));
        break;
    }
  }


  Future<void> _onsignupevent(SignUpEvent event, Emitter<AuthState> emit) async
  {
    emit(LoadingState());

    final result = await _signUpEvent.call(event.user);
    switch (result) {
      case true:
        emit(SuccessState());
        break;
      case false:
        emit(ErrorState(message: "something went wrong"));
        break;
    }
  }
}
