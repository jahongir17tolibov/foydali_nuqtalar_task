import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar_task/feature/auth/domain/use_case/register_as_user_use_case.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required this.registerAsUserUseCase,
  }) : super(const RegisterState(status: RegisterStatus.pure)) {
    on<OnRegisterPasswordObscureIconPressedEvent>(_onRegisterPasswordObscureIconPressedEvent);

    on<OnRegisterUserEvent>(_onRegisterUserEvent);
  }

  final RegisterAsUserUseCase registerAsUserUseCase;

  FutureOr<void> _onRegisterPasswordObscureIconPressedEvent(
    OnRegisterPasswordObscureIconPressedEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(passwordObscureState: !state.passwordObscureState));
  }

  FutureOr<void> _onRegisterUserEvent(
    OnRegisterUserEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await registerAsUserUseCase.execute(event.fullName, event.email, event.password).then((result) {
      if (result.errorMessage == null) {
        emit(state.copyWith(status: RegisterStatus.registerSuccessful, isLoading: false));
      } else {
        emit(state.copyWith(
          status: RegisterStatus.showMessage,
          message: result.errorMessage.toString(),
          isLoading: false,
        ));
      }
    });
  }
}
