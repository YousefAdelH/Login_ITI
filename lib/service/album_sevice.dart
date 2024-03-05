import 'package:dio/dio.dart';
import 'package:flutter_application_1/service/album.dart';

const String baseurl = "https://jsonplaceholder.typicode.com/";

class AlbumsService {
  Future<List<Album>> getAlbumsByUserId(int userId) async {
    String path = "albums?userId=$userId";

    try {
      // response.data.forEach((user) {
      //   Album users = Album.fromJson(user);

      //   listUsers.add(users);
      Response response = await Dio().get("$baseurl$path");
      List<dynamic> data = response.data as List<dynamic>;
      List<Album> albums =
          data.map((albumData) => Album.fromJson(albumData)).toList();

      return albums;
    } catch (e) {
      throw Exception("Failed to fetch albums: $e");
    }
  }
}
