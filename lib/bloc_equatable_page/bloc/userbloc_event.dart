part of 'userbloc_bloc.dart';

abstract class UserblocEvent extends Equatable {
  const UserblocEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserblocEvent {
  GetUserEvent();
}

class GetPostsEvent extends UserblocEvent {
  GetPostsEvent();
}
