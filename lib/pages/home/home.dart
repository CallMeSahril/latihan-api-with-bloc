import 'package:crud_bloc/bloc/user/user_bloc.dart';
import 'package:crud_bloc/pages/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: UserList());
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(FetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return UserDetail(
                        userId: user.id.toString(),
                      );
                    },
                  ));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(user.fullName),
                subtitle: Text(user.email),
              );
            },
          );
        } else if (state is UserError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      },
    );
  }
}
