import 'package:test_task/data_providers/random_users_api.dart';
import 'package:test_task/logics/models/user.dart';

class UsersRepository {

  Future<List<User>> getRandomUsers() async {
    final randomUsers = await RandomUsersApi().fetchRandomUsers();
    List<User> users = User.fromEntity(randomUsers);
    return users;
  }
}