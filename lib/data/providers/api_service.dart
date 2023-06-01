import 'dart:convert';

import 'package:crud_bloc/data/models/list_models.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String apiUrl = 'https://reqres.in/api/users?page=2';
  final String apiDetailUrl = 'https://reqres.in/api/users/';

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final userList = jsonResponse['data'] as List<dynamic>;
      return userList.map((userData) => User.fromJson(userData)).toList();
    } else {
      throw Exception('Failed to fetch users.');
    }
  }

  // Future<User> getDetailUsers(String num) async {
  //   final response = await http.get(Uri.parse(apiDetailUrl + num));

  //   if (response.statusCode == 200) {
  //     final jsonResponse = jsonDecode(response.body);
  //     final user = jsonResponse['data'];
  //     return User.fromJson(user);
  //   } else {
  //     throw Exception('Failed to fetch users.');
  //   }
  // }

  Future<User> getDetailUser(String userId) async {
    final response = await http.get(Uri.parse(apiDetailUrl + userId));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to fetch user details.');
    }
  }
}
