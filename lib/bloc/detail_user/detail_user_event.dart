part of 'detail_user_bloc.dart';

abstract class DetailUserEvent extends Equatable {
  const DetailUserEvent();

  @override
  List<Object> get props => [];
}

class FetchUserDetail extends DetailUserEvent {
  final String userId;

  FetchUserDetail(this.userId);

  @override
  List<Object> get props => [userId];
}
