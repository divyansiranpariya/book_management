import 'package:flutter/material.dart';

import '../model/bookmodel.dart';
import '../utils/services/book_services.dart';

class BookViewModel extends ChangeNotifier {
  final BookService bookService = BookService();
  List<Book> _books = [];

  List<Book> get books => _books;

  Future<void> fetchBooks() async {
    _books = await bookService.fetchBooks();
    notifyListeners();
  }

  Future<void> addBook(Book book) async {
    await bookService.addBook(book);
    fetchBooks();
  }
}
