import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_harmeless/posttile.dart';
import 'post.dart';

class tuttiPost extends StatefulWidget {


  @override
  _tuttiPostState createState() => _tuttiPostState();
}

class _tuttiPostState extends State<tuttiPost> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<Posts>>(context);

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostTile(post: posts[index]);
      },
    );
  }
}
