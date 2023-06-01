import 'package:crud_bloc/bloc/detail_user/detail_user_bloc.dart';
import 'package:crud_bloc/pages/widget/user_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetail extends StatelessWidget {
  final String userId;

  const UserDetail({
    this.userId = '2',
  });

  @override
  Widget build(BuildContext context) {
    final DetailUserBloc userBloc = BlocProvider.of<DetailUserBloc>(context);

    userBloc.add(FetchUserDetail(userId));

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
      ),
      body: BlocBuilder<DetailUserBloc, DetailUserState>(
        bloc: userBloc,
        builder: (context, state) {
          if (state is DetailUserLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailUserLoaded) {
            return UserDetailsWidget(user: state.user);
          } else if (state is DetailUserError) {
            return Center(
              child: Text(state.message),
            );
          }

          return Container();
        },
      ),
    );
  }
}
