part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();


  @override
  List<Object> get props => [];
}

class LogIn extends LoginEvent {
  final String login;
  const LogIn(this.login);
}

class LogOut extends LoginEvent {
  const LogOut();
}
