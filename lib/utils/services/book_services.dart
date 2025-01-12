import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/bookmodel.dart';

class BookService {
  final CollectionReference booksCollection =
      FirebaseFirestore.instance.collection('books');

  Future<List<Book>> fetchBooks() async {
    final snapshot = await booksCollection.get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<void> addBook(Book book) async {
    await booksCollection.add(book.toMap());
  }
}
