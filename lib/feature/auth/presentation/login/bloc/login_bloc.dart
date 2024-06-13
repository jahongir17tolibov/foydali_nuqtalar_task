import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/use_case/login_as_user_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.loginAsUserUseCase,
  }) : super(const LoginState(status: LoginStatus.pure)) {
    on<OnLoginPasswordObscureIconPressedEvent>(_onPasswordObscureIconPressedEvent);

    on<OnLoginUserEvent>(_onLoginUserEvent);
  }

  final LoginAsUserUseCase loginAsUserUseCase;

  FutureOr<void> _onPasswordObscureIconPressedEvent(
    OnLoginPasswordObscureIconPressedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(passwordObscureState: !state.passwordObscureState));
  }

  FutureOr<void> _onLoginUserEvent(
    OnLoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await loginAsUserUseCase.execute(event.email, event.password).then((result) {
      if (result.errorMessage == null) {
        emit(state.copyWith(status: LoginStatus.loginSuccessful, isLoading: false));
      } else {
        emit(state.copyWith(
          status: LoginStatus.showMessage,
          message: result.errorMessage.toString(),
          isLoading: false,
        ));
      }
    });
  }
}
