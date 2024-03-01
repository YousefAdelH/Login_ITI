import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screens/profile.dart';
import 'package:flutter_application_1/service/users/users.dart';

class User extends StatelessWidget {
  const User({
    super.key,
    required this.itemuser,
  });
  final UsersFromApi itemuser;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(user: itemuser),
          ),
        );
      },
      child: SizedBox(
        width: 80,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/img/5.jpg'),
                backgroundColor: Colors.green,
                maxRadius: 30,
              ),
              Text(
                itemuser.name!,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
