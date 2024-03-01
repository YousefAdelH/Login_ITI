import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screens/profile.dart';
import 'package:flutter_application_1/service/users/users.dart';

class MassageUser extends StatelessWidget {
  const MassageUser({super.key, required this.itemuser});
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
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/5.jpg'),
              backgroundColor: Colors.green,
              maxRadius: 30,
            ),
          ),
          Expanded(child: Text(itemuser.name!)),
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                maxRadius: 3,
              ),
              Text("12:00"),
              Text("am")
            ],
          )
        ],
      ),
    );
  }
}
