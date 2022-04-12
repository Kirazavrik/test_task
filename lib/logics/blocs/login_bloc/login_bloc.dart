import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with HydratedMixin{
  LoginBloc() : super(const LoginState()) {
    on<LogIn>(_onLogIn);
    on<LogOut>(_onLogOut);
  }

  void _onLogIn (LogIn event, Emitter<LoginState> emit) {
    emit(state.copyWith(login: event.login, status: LoginStatus.loggedIn));
  }

  void _onLogOut (LogOut event, Emitter<LoginState> emit) {
    emit(state.copyWith(login: '', status: LoginStatus.loggedOut));
  }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    return LoginState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    return state.toMap();
  }
}
