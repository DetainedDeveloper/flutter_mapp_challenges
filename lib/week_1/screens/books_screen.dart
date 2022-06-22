import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_1/models/book.dart';
import 'package:flutter_mapp_challenges/week_1/widgets/book_cover.dart';

class BooksScreen extends StatelessWidget {
  final List<Book> books;

  const BooksScreen({
    Key? key,
    required this.books,
  }) : super(key: key);

  static final PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (books.isNotEmpty) {
            return PageView.builder(
              controller: _pageController,
              itemCount: books.length,
              itemBuilder: (context, index) => BookCover(book: books[index]),
            );
          } else {
            return const Center(child: Text('There are no books.'));
          }
        },
      ),
    );
  }
}
