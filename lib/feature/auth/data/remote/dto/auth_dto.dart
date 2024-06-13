import 'package:equatable/equatable.dart';

class AuthDto extends Equatable {
  const AuthDto({this.fullName, this.email, this.password});

  final String? fullName;
  final String? email;
  final String? password;

  factory AuthDto.fromJson(Map<String, dynamic> json) => AuthDto(
        fullName: json['full_name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'full_name': fullName,
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [fullName, email, password];
}
