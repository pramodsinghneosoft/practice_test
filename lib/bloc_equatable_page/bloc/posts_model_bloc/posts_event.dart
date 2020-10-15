import 'package:equatable/equatable.dart';

abstract class PostsblocEvent extends Equatable {
  const PostsblocEvent();

  @override
  List<Object> get props => [];
}

class GetPostsEvent extends PostsblocEvent {
  GetPostsEvent();
}
