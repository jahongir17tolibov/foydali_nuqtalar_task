import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  const AuthModel({required this.fullName, required this.email, required this.password});

  final String fullName;
  final String email;
  final String password;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        fullName: json['full_name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'full_name': fullName,
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [fullName, email, password];
}
