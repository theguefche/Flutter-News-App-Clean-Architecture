import 'package:equatable/equatable.dart';

class LoginPayloadEntity extends Equatable {
  final String? email;
  final String? password;

  const LoginPayloadEntity({required this.email, required this.password});
  
  @override
  List<Object?> get props => [
    email,
    password
  ];
}