import 'package:firebase_storage/firebase_storage.dart';


class GestioneStorage{

  //StorageReference ref = FirebaseStorage().ref().child("prova/external-content.duckduckgo.com.jpeg");

  StorageReference ref = FirebaseStorage().ref();

  Future<String> downloadURL(String url) async {
    ref= await ref.child(url);
    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

}