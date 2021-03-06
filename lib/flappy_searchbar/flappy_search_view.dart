import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class FlappySearchBarView extends StatefulWidget {
  @override
  _FlappySearchBarViewState createState() => _FlappySearchBarViewState();
}

class _FlappySearchBarViewState extends State<FlappySearchBarView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar<Post>(
                onSearch: search,
                onItemFound: (Post post, int index) {
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                  );
                },
              ))),
    );
  }

  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}
