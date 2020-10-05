import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:url_launcher/url_launcher.dart';

class WordPressApiView extends StatefulWidget {
  @override
  _WordPressApiViewState createState() => _WordPressApiViewState();
}

class _WordPressApiViewState extends State<WordPressApiView> {
  wp.WordPress wordPress = wp.WordPress(baseUrl: "https://demo.wp-api.org");

  _fetchPosts() {
    Future<List<wp.Post>> posts = wordPress.fetchPosts(
        postParams: wp.ParamsPostList(
            context: wp.WordPressContext.view, pageNum: 1, perPage: 10),
        fetchAuthor: true,
        fetchFeaturedMedia: true,
        fetchComments: true);

    return posts;
  }

  _getPostsImage(wp.Post post) {
    if (post.featuredMedia == null) {
      return SizedBox();
    }
    return Image.network(post.featuredMedia.sourceUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WordPress View")),
      body: Container(
          child: FutureBuilder<List<wp.Post>>(
              future: _fetchPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none) {
                  return Container();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return _buildListView(snapshot.data);
              })),
    );
  }

  Widget _buildListView(List<wp.Post> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          wp.Post post = data[index];
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _getPostsImage(post),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    post.title.rendered.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Html(
                    data: post.excerpt.rendered.toString(),
                    onLinkTap: (String link) {
                      _launchUrl(link);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(post.date.toString().replaceAll('T', ' ')),
                      Text(post.author.name),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  _launchUrl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Cannot launch $link';
    }
  }
}
