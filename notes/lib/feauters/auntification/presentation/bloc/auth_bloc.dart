import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/auntification/domain/usecase/login_usecase.dart';
import 'package:notes/feauters/auntification/domain/usecase/register_usecase.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_event.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  AuthBloc(this.loginUsecase, this.registerUsecase)
      : super(InitialAuthState()) {
    on<LoginAuthEvent>(_onLogin);
    on<RegisterAuthEvent>(_onRegister);
  }

  void _onLogin(LoginAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      await loginUsecase(event.email, event.password);
      emit(SuccefulAuthState());
    } catch (e) {
      emit(ErroAuthState(error: e.toString()));
    }
  }

  void _onRegister(RegisterAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      await registerUsecase(event.email, event.password);
      emit(SuccefulAuthState());
    } catch (e) {
      emit(ErroAuthState(error: e.toString()));
    }
  }
}
