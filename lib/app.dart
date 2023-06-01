import 'package:crud_bloc/bloc/detail_user/detail_user_bloc.dart';
import 'package:crud_bloc/bloc/user/user_bloc.dart';

import 'package:crud_bloc/data/providers/api_service.dart';
import 'package:crud_bloc/pages/detail/detail.dart';
import 'package:crud_bloc/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(UserService())),
        BlocProvider(create: (context) => DetailUserBloc(UserService())),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}
