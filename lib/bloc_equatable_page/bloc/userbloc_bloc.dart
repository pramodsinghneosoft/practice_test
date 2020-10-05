import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite_test/bloc_equatable_page/model/user_model.dart';
import 'package:sqflite_test/bloc_equatable_page/model/user_repository.dart';
import 'package:sqflite_test/bloc_pattern/posts_model.dart';

part 'userbloc_event.dart';
part 'userbloc_state.dart';

class UserblocBloc extends Bloc<UserblocEvent, UserblocState> {
  UserRepositoryImpl userRepositoryImpl;
  UserblocBloc(this.userRepositoryImpl) : super(null);

  UserblocState get initialState => UserblocInitial();

  @override
  Stream<UserblocState> mapEventToState(
    UserblocEvent event,
  ) async* {
    yield UserblocLoading();
    if (event is GetUserEvent) {
      try {
        final userModel = await userRepositoryImpl.getUserData();
        yield UserblocLoaded(userModel: userModel);
      } catch (e) {
        print(e.toString());
        yield UserblocError(e.toString());
      }
    }
    // else if (event is GetPostsEvent) {
    //   try {
    //     final postsModel = await userRepositoryImpl.getPostsData();
    //     yield UserblocLoaded(postsModel: postsModel);
    //   } catch (e) {
    //     yield UserblocError(e.toString());
    //   }
    // }
  }
}
