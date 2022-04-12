import 'package:flutter/material.dart';

import '../logics/models/user.dart';

class DetailUserPage extends StatelessWidget {
  final User user;

  const DetailUserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.lastName)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: Ink.image(
                    image: NetworkImage(user.pictureLargeUrl),
                    fit: BoxFit.cover,
                    width: 128,
                    height: 128,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                user.firstName + ' ' + user.lastName,
                style: const TextStyle(fontSize: 28),
              ),
            ),
            Text(
              user.country + ', ' + user.city,
              style: const TextStyle(fontSize: 21),
            )
          ],
        ),
      ),
    );
  }
}
