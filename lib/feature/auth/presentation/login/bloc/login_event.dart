part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class OnLoginPasswordObscureIconPressedEvent extends LoginEvent {}

class OnLoginUserEvent extends LoginEvent {
  OnLoginUserEvent({required this.email, required this.password});

  final String email;
  final String password;
}
