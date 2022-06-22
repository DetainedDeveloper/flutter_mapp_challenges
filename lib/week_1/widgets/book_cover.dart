import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_1/models/book.dart';
import 'package:flutter_mapp_challenges/week_1/screens/book_info_screen.dart';

class BookCover extends StatelessWidget {
  final Book book;

  const BookCover({
    Key? key,
    required this.book,
  }) : super(key: key);

  List<Widget> _children({
    required BuildContext context,
    required Book book,
    required Size size,
  }) {
    return [
      SizedBox.fromSize(
        size: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 8.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Hero(
              tag: book.id,
              child: Image.network(
                book.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 3,
            ),
            Text(
              'Author : ${book.authors[0]}',
              style: const TextStyle(fontStyle: FontStyle.italic),
              maxLines: 3,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text(
              'Publisher : ${book.publisher}',
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 3,
            ),
            Text(
              'Published on : ${book.publishedDate}',
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 3,
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double viewWidth = size.width / (portrait ? 1 : 3);
    final double viewHeight = size.height / (portrait ? 1.75 : 1.25);

    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookInfoScreen(book: book),
          ),
        ),
        child: Builder(builder: (context) {
          if (portrait) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _children(
                context: context,
                book: book,
                size: Size(viewWidth, viewHeight),
              ),
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _children(
                context: context,
                book: book,
                size: Size(viewWidth, viewHeight),
              ),
            );
          }
        }),
      ),
    );
  }
}
