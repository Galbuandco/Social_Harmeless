import "package:flutter/material.dart";
import 'package:social_harmeless/Autenticazione.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final Autenticazione _auth = Autenticazione();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String nick = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0,
        title: Text('Social Harmless',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 20),
                  labelText: "Enter Email",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      )),
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
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 20),
                  labelText: "Enter Password",
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
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 20),
                  labelText: "Enter Nickname",
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
                obscureText: false,
                validator: (val) => val.length < 3 ? 'Enter a nick 3+ chars long' : null,
                onChanged: (val) {
                  setState(() => nick = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.blue[400],fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()){
                      await _auth.Registrazione(email, password, nick);
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}