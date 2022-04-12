import 'dart:convert';

import 'package:test_task/logics/models/user_entity.dart';
import 'package:http/http.dart' as http;

class RandomUsersApi {
  static const _baseUrl = 'https://randomuser.me/api';

  Future<UserEntity> fetchRandomUsers () async {
    final response = await http.get(Uri.parse(
      '$_baseUrl/?results=20'
    ));
    if (response.statusCode == 200) {
      return UserEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed load api');
    }
  }
}