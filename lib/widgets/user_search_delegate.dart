import 'package:flutter/material.dart';
import 'package:test_task/widgets/widgets.dart';

import '../logics/models/user.dart';

class UserSearchDelegate extends SearchDelegate {
  final List<User> users;

  UserSearchDelegate({required this.users});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _search();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _search();
  }

  Widget _search() {
    List<User> searchUsers = users
        .where((element) =>
    element.firstName.toLowerCase().contains(query.toLowerCase()) ||
        element.lastName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return usersListView(searchUsers);
  }
}
