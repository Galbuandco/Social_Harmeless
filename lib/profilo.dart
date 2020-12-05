import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_harmeless/Autenticazione.dart';
import 'package:social_harmeless/database.dart';

class Profilo extends StatefulWidget {
  @override
  _ProfiloState createState() => _ProfiloState();
}

class _ProfiloState extends State<Profilo> {

  String amico="";
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:150.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              labelText: "Enter New Friend ID",
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
            validator: (val) => val.length < 6 ? 'Ids are 10+ letters long' : null,
            onChanged: (val) {
              setState(() => amico = val);
            },
          ),
          SizedBox(height: 20.0),
          RaisedButton(
              color: Colors.blue[400],
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () async {
                Gestione_Database(uid: auth.currentUser.uid).NewFriend(amico);
              }
          ),
          Padding(
            padding: const EdgeInsets.only(top:300.0),
            child: Container(
              child: FlatButton.icon(
                icon: Icon(Icons.logout),
                label: Text("Esci dal tuo profilo"),
                onPressed: () async{
                  await Autenticazione().LogOut();
                },
              ),
            ),
          ),
        ],
      ),
    )
    ;
  }
}
