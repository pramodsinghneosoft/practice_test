import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_test/bloc_equatable_page/bloc/posts_model_bloc/posts_event.dart';
import 'package:sqflite_test/bloc_equatable_page/bloc/posts_model_bloc/posts_state.dart';
import 'package:sqflite_test/bloc_equatable_page/model/user_repository.dart';

class PostsblocBloc extends Bloc<PostsblocEvent, PostsblocState> {
  UserRepositoryImpl userRepositoryImpl;
  PostsblocBloc(this.userRepositoryImpl) : super(null);

  PostsblocState get initialState => PostsblocInitial();

  @override
  Stream<PostsblocState> mapEventToState(
    PostsblocEvent event,
  ) async* {
    yield PostsblocLoading();
    if (event is GetPostsEvent) {
      try {
        final postsModel = await userRepositoryImpl.getPostsData();
        yield PostsblocLoaded(postsModel: postsModel);
      } catch (e) {
        print(e.toString());
        yield PostsblocError(e.toString());
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
