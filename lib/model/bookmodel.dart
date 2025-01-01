class Book {
  final String id;
  final String title;
  final String author;
  final bool isBookmarked;

  Book(
      {required this.id,
      required this.title,
      required this.author,
      this.isBookmarked = false});

  factory Book.fromMap(Map<String, dynamic> data) {
    return Book(
      id: data['id'],
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      isBookmarked: data['isBookmarked'] ?? false,
    );
  }
}
