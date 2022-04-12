import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/app.dart';
import 'package:test_task/data_providers/users_repository.dart';
import 'package:test_task/logics/blocs/login_bloc/login_bloc.dart';
import 'package:test_task/widgets/user_search_delegate.dart';
import 'package:test_task/widgets/widgets.dart';

import '../logics/blocs/users_bloc/user_bloc.dart';
import '../logics/models/user.dart';

class RandomUsersPage extends StatelessWidget {
  const RandomUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(repository: UsersRepository()),
      child: const RandomUsersView(),
    );
  }
}

class RandomUsersView extends StatelessWidget {
  const RandomUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(const LoadRandomUsers());
    return Scaffold(
      appBar: AppBar(
        title: BlocProvider.value(
          value: BlocProvider.of<LoginBloc>(context),
          child: Text(context.read<LoginBloc>().state.login),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: UserSearchDelegate(
                        users: BlocProvider.of<UserBloc>(context).state.users));
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(const LogOut());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TestTaskApp()));
              },
              icon: const Icon(Icons.login))
        ],
        automaticallyImplyLeading: false,
      ),
      body: const RandomUserView(),
    );
  }
}

class RandomUserView extends StatelessWidget {
  const RandomUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state.status == UserStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.status == UserStatus.success) {
        List<User> users = state.users;
        return RefreshIndicator(
          child: usersListView(users),
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 100));
            BlocProvider.of<UserBloc>(context).add(const LoadRandomUsers());
          },
        );
      }
      return Container();
    });
  }
}
