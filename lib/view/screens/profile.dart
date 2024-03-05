import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/album.dart';
import 'package:flutter_application_1/service/album_sevice.dart';
import 'package:flutter_application_1/service/users/users.dart';

class UserProfileScreen extends StatefulWidget {
  final UsersFromApi user;

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final AlbumsService albumsService = AlbumsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.purple,
              Colors.deepPurple,
            ],
          ),
        ),
        child: FutureBuilder<List<Album>>(
          future: albumsService.getAlbumsByUserId(widget.user.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Album>? albums = snapshot.data;
              if (albums != null && albums.isNotEmpty) {
                print(albums);
                return ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        albums[index].title!,
                        style: TextStyle(color: Colors.white),
                      ),
                      // Add any other album information you want to display
                    );
                  },
                );
              } else {
                return Center(child: Text('No albums found'));
              }
            }
          },
        ),
      ),
    );
  }
}
