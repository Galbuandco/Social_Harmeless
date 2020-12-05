import 'package:flutter/material.dart';
import 'package:social_harmeless/Storage.dart';
import 'package:social_harmeless/post.dart';
import 'package:social_harmeless/posttile.dart';

class builder extends StatefulWidget {

  final String url;

  const builder ({ Key key, this.url }): super(key: key);

  @override
  _builderState createState() => _builderState();
}

class _builderState extends State<builder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: GestioneStorage().downloadURL(widget.url),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Container(
          height: 650,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(Radius.circular(20),),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                snapshot.data??"",
              ),
            ),
          ),
        );
      }
    );
  }
}
