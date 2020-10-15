import 'package:equatable/equatable.dart';
import 'package:sqflite_test/bloc_equatable_page/model/posts_model.dart';

abstract class PostsblocState extends Equatable {
  const PostsblocState();
}

class PostsblocInitial extends PostsblocState {
  PostsblocInitial();

  @override
  List<Object> get props => [];
}

class PostsblocLoading extends PostsblocState {
  PostsblocLoading();

  @override
  List<Object> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class PostsblocLoaded extends PostsblocState {
  List<PostsModel> postsModel;
  PostsblocLoaded({this.postsModel});

  @override
  List<Object> get props => [postsModel];
}

// ignore: must_be_immutable
class PostsblocError extends PostsblocState {
  String message;
  PostsblocError(this.message);

  @override
  List<Object> get props => [message];
}
