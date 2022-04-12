import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/presentation/random_users_page.dart';

import '../logics/blocs/login_bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test App')),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: 'Log In',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    onChanged: (text) =>
                        context.read<LoginBloc>().add(LogIn(text)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RandomUsersPage()));
                      },
                      child: const Text('Войти')),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget startedPage(BuildContext context) {
  final login = BlocProvider.of<LoginBloc>(context).state.login;
  if (login == '') {
    return const RandomUsersPage();
  } else {
    return const LoginPage();
  }
}
