import 'package:dio/dio.dart';
import 'package:flutter_application_1/service/users/users.dart';

const String baseurl = "https://jsonplaceholder.typicode.com/";

class UserService {
  Future<List<UsersFromApi>> getUsers() async {
    const String path = "users";
    List<UsersFromApi> listUsers = [];

    try {
      Response response = await Dio().get("$baseurl$path");

      response.data.forEach((user) {
        UsersFromApi users = UsersFromApi.fromJson(user);

        listUsers.add(users);
        print(listUsers);
      });
      return listUsers;
    } catch (e) {
      print("Error: $e");
      throw Exception("Failed to fetch users: $e");
    }
  }
}
