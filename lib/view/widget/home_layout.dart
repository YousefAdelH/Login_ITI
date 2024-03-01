import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screens/user_display.dart';
import 'package:flutter_application_1/view/screens/user_messsage.dart';
import 'package:flutter_application_1/service/user_srvice.dart';
import 'package:flutter_application_1/service/users/users.dart';
import 'package:flutter_application_1/view/widget/shimme_loding.dart';
import 'package:shimmer/shimmer.dart';

class ChatUser extends StatefulWidget {
  const ChatUser({Key? key}) : super(key: key);

  @override
  State<ChatUser> createState() => _ChatUserState();
}

class _ChatUserState extends State<ChatUser> {
  final UserService apiservice = new UserService();
  late Future<List<UsersFromApi>>
      usersFuture; // Declare a Future to hold the result of getdata()

  @override
  void initState() {
    super.initState();
    usersFuture =
        getdata(); // Assign the Future returned by getdata() to usersFuture
  }

  Future<List<UsersFromApi>> getdata() async {
    return await apiservice.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
            child: Icon(Icons.border_color),
          )
        ],
        title: Text("Chat"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Other widgets...
            FutureBuilder<List<UsersFromApi>>(
              future: usersFuture, // Pass the Future to FutureBuilder
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Other widgets...
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return ShimmeLoding();
                                  },
                                  itemCount: 5, // Placeholder items
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 500,
                              width: double.infinity,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 500,
                                        width: double.infinity,
                                        child: ListView.builder(
                                          itemBuilder: (context, index) {
                                            return ShimmeLoding();
                                          },
                                          itemCount: 5,
                                          scrollDirection: Axis.vertical,
                                        ),
                                      )
                                    ],
                                  );
                                },
                                itemCount: 5, // Placeholder items
                                scrollDirection: Axis.vertical,
                              ),
                            )
                          ],
                        ),
                        // Other widgets...
                      ],
                    ),
                  ); // Show a loading indicator while data is being fetched
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  // If data is fetched successfully, build the UI
                  List<UsersFromApi> users = snapshot.data ??
                      []; // Use null-aware operator to handle null case
                  return Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 120,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return User(
                                itemuser: users[index],
                              );
                            },
                            itemCount: users.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
            FutureBuilder<List<UsersFromApi>>(
              future: usersFuture, // Pass the Future to FutureBuilder
              builder: (context, snapshot) {
                // If data is fetched successfully, build the UI
                List<UsersFromApi> users = snapshot.data ??
                    []; // Use null-aware operator to handle null case
                return Column(
                  children: [
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return MassageUser(
                            itemuser: users[index],
                          );
                        },
                        itemCount: users.length,
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  ],
                );
              },
            ),
            // Other widgets...
          ],
        ),
      ),
    );
  }
}
