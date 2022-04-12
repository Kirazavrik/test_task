import 'package:equatable/equatable.dart';
import 'package:test_task/logics/models/user_entity.dart';

class User extends Equatable {
  final String firstName;
  final String lastName;
  final String country;
  final String city;
  final String pictureMediumUrl;
  final String pictureLargeUrl;

  const User(
      {required this.firstName,
      required this.lastName,
      required this.country,
      required this.city,
      required this.pictureMediumUrl,
      required this.pictureLargeUrl});

  @override
  List<Object?> get props =>
      [firstName, lastName, country, city, pictureMediumUrl];

  static List<User> fromEntity(UserEntity entity) {
    final users = <User>[];
    entity.results?.forEach((v) {
      users.add(fromResults(v));
    });
    return users;
  }

  static User fromResults(Results results) {
    return User(
        firstName: results.name?.first ?? '',
        lastName: results.name?.last ?? '',
        country: results.location?.country ?? '',
        city: results.location?.city ?? '',
        pictureMediumUrl: results.picture?.medium ?? '',
        pictureLargeUrl: results.picture?.large ?? '');
  }
}
