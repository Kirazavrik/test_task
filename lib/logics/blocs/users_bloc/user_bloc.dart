import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/data_providers/users_repository.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository repository;

  UserBloc({required this.repository}) : super(const UserState()) {
    on<LoadRandomUsers>(_onLoadRandomUsers);
  }

  void _onLoadRandomUsers(LoadRandomUsers event, Emitter<UserState> emit) async {
    try {
      final users = await repository.getRandomUsers();
      emit(state.copyWith(users: users, status: UserStatus.success));
    } on Exception {
      emit(state.copyWith(status: UserStatus.failure));
    }
  }
}
