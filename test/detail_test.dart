import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class UserService {
  static const String apiDetailUrl = 'https://reqres.in/api/users/';

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

void main() async {
  final userService = UserService();

  try {
    final user = await userService.getDetailUser('2');
    print('User Details:');
    print('ID: ${user.id}');
    print('Email: ${user.email}');
    print('First Name: ${user.firstName}');
    print('Last Name: ${user.lastName}');
    print('Avatar: ${user.avatar}');
  } catch (e) {
    print('Error: $e');
  }
}
