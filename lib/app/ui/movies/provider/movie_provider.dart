import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/movie.dart';

class MovieProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'movies';

  Future<void> addMovie(Movie movie) async {
    final docRef = _firestore.collection(_collectionName).doc();
    movie.id = docRef.id;
    await docRef.set(movie.toJson());
  }

  Future<List<Movie>> getAllMovies() async {
    final snapshot = await _firestore.collection(_collectionName).get();
    return snapshot.docs
        .map((doc) => Movie.fromJson(doc.id, doc.data()))
        .toList();
  }
}
