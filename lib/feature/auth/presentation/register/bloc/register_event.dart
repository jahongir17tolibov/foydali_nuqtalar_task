part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class OnRegisterPasswordObscureIconPressedEvent extends RegisterEvent {}

class OnRegisterUserEvent extends RegisterEvent {
  OnRegisterUserEvent({required this.fullName, required this.email, required this.password});

  final String fullName;
  final String email;
  final String password;
}
