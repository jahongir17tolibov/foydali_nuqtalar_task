part of 'register_bloc.dart';

enum RegisterStatus { pure, showMessage, registerSuccessful }

class RegisterState extends Equatable {
  const RegisterState({
    required this.status,
    this.passwordObscureState = true,
    this.isLoading = false,
    this.message,
  });

  final RegisterStatus status;
  final bool passwordObscureState;
  final bool isLoading;
  final String? message;

  RegisterState copyWith({
    RegisterStatus? status,
    bool? passwordObscureState,
    bool? isLoading,
    String? message,
  }) =>
      RegisterState(
        status: status ?? this.status,
        passwordObscureState: passwordObscureState ?? this.passwordObscureState,
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [status, passwordObscureState, isLoading, message];
}
