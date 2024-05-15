import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getMovies() async {
  List movies =[];
  CollectionReference collectionReferencePeople = db.collection('movies');

  QuerySnapshot queryMovies = await collectionReferencePeople.get();

  queryMovies.docs.forEach((documento) {
    movies.add(documento.data());
   });

  return movies;
}