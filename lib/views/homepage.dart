import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModel/book_viewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bookViewModel = Provider.of<BookViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Keeper"),
      ),
      body: FutureBuilder(
        future: bookViewModel.fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final books = bookViewModel.books;
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
              );
            },
          );
        },
      ),
    );
  }
}
