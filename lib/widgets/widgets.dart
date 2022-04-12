import 'package:flutter/material.dart';
import 'package:test_task/presentation/detail_user_page.dart';
import 'package:transparent_image/transparent_image.dart';

import '../logics/models/user.dart';

Widget usersListView(List<User> users) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailUserPage(user: users[index])));
            },
            child: Card(
              child: ListTile(
                leading: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: users[index].pictureMediumUrl),
                title:
                    Text(users[index].firstName + ' ' + users[index].lastName),
              ),
            ),
          );
        }),
  );
}
