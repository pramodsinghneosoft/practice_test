// import 'dart:async';

// import 'package:sqflite_test/bloc_pattern/network.dart';
// import 'package:sqflite_test/bloc_pattern/posts_model.dart';
// import 'package:sqflite_test/get_it_files/service_locator_view.dart';

// enum PostsEvent { Fetch, Delete }

// class PostsBloc {
//   var networkInstance = locator<NetworkService>();
//   final _streamController = StreamController<List<PostsModel>>();
//   StreamSink<List<PostsModel>> get postsSink => _streamController.sink;
//   Stream<List<PostsModel>> get postsStream => _streamController.stream;

//   final _eventController = StreamController<PostsEvent>();

//   StreamSink<PostsEvent> get postsEventSink => _eventController.sink;
//   Stream<PostsEvent> get postsEventStream => _eventController.stream;

//   PostsBloc() {
//     postsEventStream.listen((event) async {
//       if (event == PostsEvent.Fetch) {
//         try {
//           var result = await networkInstance.getPosts();
//           if (result != null) {
//             List<PostsModel> modelResult = result;
//             postsSink.add(modelResult);
//           } else {
//             postsSink.addError("Something went wrong");
//           }

//           // ignore: unused_catch_clause
//         } on Exception catch (e) {
//           postsSink.addError("Something went wrong");
//         }
//       }
//     });
//   }

//   void dispose() {
//     _streamController.close();
//     _eventController.close();
//   }
// }
