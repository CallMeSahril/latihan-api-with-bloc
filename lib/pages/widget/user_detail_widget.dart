import 'package:crud_bloc/data/models/list_models.dart';
import 'package:flutter/material.dart';

class UserDetailsWidget extends StatelessWidget {
  final User user;

  const UserDetailsWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.avatar),
          ),
          SizedBox(height: 16),
          Text(
            'Name: ${user.firstName} ${user.lastName}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ${user.email}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'ID: ${user.id}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
