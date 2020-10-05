part of 'userbloc_bloc.dart';

abstract class UserblocState extends Equatable {
  const UserblocState();
}

class UserblocInitial extends UserblocState {
  UserblocInitial();

  @override
  List<Object> get props => [];
}

class UserblocLoading extends UserblocState {
  UserblocLoading();

  @override
  List<Object> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class UserblocLoaded extends UserblocState {
  List<UserModel> userModel;
  // List<PostsModel> postsModel;
  UserblocLoaded({this.userModel});

  @override
  List<Object> get props => [userModel];
}

// ignore: must_be_immutable
class UserblocError extends UserblocState {
  String message;
  UserblocError(this.message);

  @override
  List<Object> get props => [message];
}
