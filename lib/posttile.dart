
import 'package:social_harmeless/prova.dart';

import 'post.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {

  final Posts post;

  PostTile({ this.post });

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          builder(url: post.Immagine),
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 10, 3, 30),
            child: Text( post.Utente +": " +post.Testo,style: TextStyle(fontSize: 18),),
          ),
        ],
      );
  }
}


