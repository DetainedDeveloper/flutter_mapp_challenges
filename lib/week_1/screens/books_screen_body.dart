import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_1/models/book.dart';
import 'package:flutter_mapp_challenges/week_1/screens/books_screen.dart';

class BooksScreenBody extends StatelessWidget {
  const BooksScreenBody({Key? key}) : super(key: key);

  Future<List<dynamic>> parseData(BuildContext context) async {
    List<dynamic> rawData = await json.decode(
      await DefaultAssetBundle.of(context).loadString('assets/data/books.json'),
    );
    return rawData;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: FutureBuilder<List<dynamic>>(
        future: parseData(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: Text('None'));

            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active:
              return const Center(child: Text('Active'));

            case ConnectionState.done:
              List<Book> books = List.from(
                snapshot.data!.map((data) => Book.fromMap(data)),
              );

              return BooksScreen(books: books);
          }
        },
      ),
    );
  }
}
