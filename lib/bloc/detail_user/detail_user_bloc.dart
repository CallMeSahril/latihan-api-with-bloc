import 'package:bloc/bloc.dart';
import 'package:crud_bloc/data/models/list_models.dart';
import 'package:crud_bloc/data/providers/api_service.dart';
import 'package:equatable/equatable.dart';

part 'detail_user_event.dart';
part 'detail_user_state.dart';

class DetailUserBloc extends Bloc<DetailUserEvent, DetailUserState> {
  final UserService userService;

  DetailUserBloc(this.userService) : super(DetailUserInitial()) {
    on<FetchUserDetail>((event, emit) async {
      emit(DetailUserLoading());

      try {
        final user = await userService.getDetailUser(event.userId);
        emit(DetailUserLoaded(user));
      } catch (e) {
        emit(DetailUserError('Failed to fetch user details.'));
      }
    });
  }
}
