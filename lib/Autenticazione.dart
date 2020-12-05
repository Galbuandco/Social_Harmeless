import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_harmeless/database.dart';
import 'package:social_harmeless/user.dart';

class Autenticazione{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  MyUser _userFromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges()
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign in with email
  Future SignIn(String mail, String passwd) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mail,
          password: passwd,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //register with email
  Future Registrazione(String mail, String psswd, String nome) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mail,
          password: psswd,
      );
      Gestione_Database(uid: _auth.currentUser.uid).updateUserData(nome);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //log out
  Future LogOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
}