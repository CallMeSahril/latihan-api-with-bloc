import 'package:bloc/bloc.dart';
import 'package:crud_bloc/data/models/list_models.dart';
import 'package:crud_bloc/data/providers/api_service.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;

  UserBloc(this.userService) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userService.getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError('Failed to fetch users.'));
      }
    });
  }
}
