import "package:cloud_firestore/cloud_firestore.dart";
import 'package:social_harmeless/post.dart';

class Gestione_Database{

  final String uid;
  Gestione_Database({ this.uid });

  final CollectionReference Utenti = FirebaseFirestore.instance.collection("Utenti");
  final CollectionReference PostCollection = FirebaseFirestore.instance.collection("Post");

  Future<void> updateUserData(String nome) async {
    return await Utenti.doc(uid).set({
      "uid" : uid,
      'name': nome,
      'seguiti': [],
    });
  }
  
  Future<void> NewFriend(String nome){
    return Utenti.doc(uid).update({"Amici": FieldValue.arrayUnion([nome])});
  }

  List<Posts> _PostList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Posts(
        Testo:doc.get("Testo") ?? "aspetta",
        Utente:doc.get('Nome_Utente') ?? "aspetta",
        Immagine: doc.get('Nome_immagine') ?? "aspetta",
      );
    }).toList();
  }

  Stream<List<Posts>> get post{
    return PostCollection.where("Interessati",arrayContains: uid).snapshots().map(_PostList);
  }



}