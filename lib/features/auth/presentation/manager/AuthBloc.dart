import 'package:ecommerce/features/auth/domain/usecases/signin-usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Di/SettingDi.dart';

part 'AuthEvent.dart';
part 'AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase _signInUsecase;

  AuthBloc() : _signInUsecase = getit<SignInUsecase>(), super(LoadingState()) {
    on<SignInEvent>(_onsigninevent);
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
}
