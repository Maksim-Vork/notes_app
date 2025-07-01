abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccefulAuthState extends AuthState {}

class ErroAuthState extends AuthState {
  final String error;

  ErroAuthState({required this.error});
}
