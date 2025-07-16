abstract class AuthEvent {}

class LoginAuthEvent extends AuthEvent {
  final String email;
  final String password;

  LoginAuthEvent({required this.email, required this.password});
}

class RegisterAuthEvent extends AuthEvent {
  final String email;
  final String password;

  RegisterAuthEvent({required this.email, required this.password});
}

class SignOutAuthEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}
