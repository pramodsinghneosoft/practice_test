import 'package:flutter/material.dart';
import 'package:sqflite_test/bloc_pattern/posts_bloc.dart';
import 'package:sqflite_test/bloc_pattern/posts_model.dart';
import 'package:sqflite_test/get_it_files/service_locator_view.dart';

class PostsView extends StatefulWidget {
  @override
  _PostsViewState createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  var postsInstance = locator<PostsBloc>();

  @override
  void initState() {
    postsInstance.postsEventSink.add(PostsEvent.Fetch);
    super.initState();
  }

  @override
  void dispose() {
    postsInstance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts View")),
      body: StreamBuilder<List<PostsModel>>(
        stream: postsInstance.postsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _listViewData(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error ?? "Error"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _listViewData(List<PostsModel> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var posts = list[index];
          return Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
            child: Card(
                elevation: 2,
                child: ListTile(
                  title: Text(
                    posts.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    posts.body,
                    style: TextStyle(fontSize: 16),
                  ),
                  leading: Text(
                    posts.id.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Text(
                    posts.userId.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  contentPadding: EdgeInsets.all(10),
                )),
          ));
        });
  }
}
