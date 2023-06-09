part of 'detail_user_bloc.dart';

abstract class DetailUserState extends Equatable {
  const DetailUserState();

  @override
  List<Object> get props => [];
}

class DetailUserInitial extends DetailUserState {}

class DetailUserLoading extends DetailUserState {}

class DetailUserLoaded extends DetailUserState {
  final User user;

  DetailUserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class DetailUserError extends DetailUserState {
  final String message;

  DetailUserError(this.message);

  @override
  List<Object> get props => [message];
}
