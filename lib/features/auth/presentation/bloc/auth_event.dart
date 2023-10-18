abstract class AuthEvent {
  const AuthEvent();
}

class Login extends AuthEvent {
  final String email;
  final String password;

  Login({required this.email, required this.password});
}

class CheckAuth extends AuthEvent {}