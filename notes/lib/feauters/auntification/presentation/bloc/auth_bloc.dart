import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/feauters/auntification/domain/usecase/check_auth_usecase.dart';
import 'package:notes/feauters/auntification/domain/usecase/login_usecase.dart';
import 'package:notes/feauters/auntification/domain/usecase/register_usecase.dart';
import 'package:notes/feauters/auntification/domain/usecase/sign_out_usecase.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_event.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final CheckAuthUsecase checkAuthUsecase;
  final SignOutUsecase signOutUsecase;
  AuthBloc(this.loginUsecase, this.registerUsecase, this.checkAuthUsecase,
      this.signOutUsecase)
      : super(InitialAuthState()) {
    on<LoginAuthEvent>(_onLogin);
    on<RegisterAuthEvent>(_onRegister);
    on<SignOutAuthEvent>(_onSingnOut);
    on<CheckAuthEvent>(_onCheck);
  }

  void _onLogin(LoginAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      await loginUsecase(event.email, event.password);
      emit(SuccefulAuthState());
    } catch (e) {
      emit(ErrorAuthState(error: e.toString()));
    }
  }

  void _onRegister(RegisterAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      await registerUsecase(event.email, event.password);
      emit(SuccefulAuthState());
    } catch (e) {
      emit(ErrorAuthState(error: e.toString()));
    }
  }

  void _onSingnOut(SignOutAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      await signOutUsecase();
      emit(InitialAuthState());
    } catch (e) {
      emit(ErrorAuthState(error: e.toString()));
    }
  }

  void _onCheck(CheckAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      final bool auntification = await checkAuthUsecase();
      auntification ? emit(SuccefulAuthState()) : emit(InitialAuthState());
    } catch (e) {
      emit(ErrorAuthState(error: e.toString()));
    }
  }
}
