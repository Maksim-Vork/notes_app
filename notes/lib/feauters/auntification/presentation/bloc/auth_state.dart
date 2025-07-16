abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccefulAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String error;

  ErrorAuthState({required this.error});
}
