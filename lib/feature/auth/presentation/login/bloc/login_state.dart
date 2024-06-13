part of 'login_bloc.dart';

enum LoginStatus { pure, showMessage, loginSuccessful }

class LoginState extends Equatable {
  const LoginState({
    required this.status,
    this.passwordObscureState = true,
    this.isLoading = false,
    this.message,
  });

  final LoginStatus status;
  final bool passwordObscureState;
  final bool isLoading;
  final String? message;

  LoginState copyWith({
    LoginStatus? status,
    bool? passwordObscureState,
    bool? isLoading,
    String? message,
  }) =>
      LoginState(
        status: status ?? this.status,
        passwordObscureState: passwordObscureState ?? this.passwordObscureState,
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [status, passwordObscureState, isLoading, message];
}
