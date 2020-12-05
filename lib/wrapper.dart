import 'package:flutter/material.dart';
import 'package:social_harmeless/auth.dart';
import 'package:social_harmeless/main.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);

    if(user!=null){
      return MyStatefulWidget();
    }else{
      return Auth();
    }

  }
}
