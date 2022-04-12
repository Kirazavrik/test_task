part of 'login_bloc.dart';

enum LoginStatus { loggedIn, loggedOut }

class LoginState extends Equatable {
  final LoginStatus status;
  final String login;

  const LoginState(
      {this.status = LoginStatus.loggedOut,
      this.login = ''});

  LoginState copyWith({bool? loggedIn, String? login, LoginStatus? status}) {
    return LoginState(
        login: login ?? this.login,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [login];

  Map<String, dynamic> toMap() {
    return {
      'login': this.login,
    };
  }

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      login: map['login'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginState.fromJson(String source) =>
      LoginState.fromMap(json.decode(source));
}
