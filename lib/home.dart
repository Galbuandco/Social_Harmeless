import 'package:flutter/material.dart';
import 'package:social_harmeless/figlio.dart';
import 'package:social_harmeless/post.dart';
import 'database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Posts>>.value(
      initialData: [],
      value: Gestione_Database(uid: auth.currentUser.uid).post,
      child: tuttiPost(),
    );
  }
}
