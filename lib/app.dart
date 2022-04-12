
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/presentation/login_page.dart';
import 'package:test_task/presentation/random_users_page.dart';

import 'logics/blocs/login_bloc/login_bloc.dart';

class TestTaskApp extends StatelessWidget {
  const TestTaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/' : (context) {
            if (BlocProvider.of<LoginBloc>(context).state.login == '') {
              return LoginPage();
            } else {
              return RandomUsersPage();
            }
          },
        },
      ),
    );
  }
}

