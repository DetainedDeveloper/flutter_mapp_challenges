import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_1/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

class BookInfoScreen extends StatelessWidget {
  final Book book;

  const BookInfoScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              collapsedHeight: kToolbarHeight,
              expandedHeight: kToolbarHeight * 4,
              flexibleSpace: Hero(
                tag: book.id,
                child: Image.network(
                  book.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverHeader(book: book),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(book.description),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Purchase'),
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(book.previewLink))) {
              launchUrl(Uri.parse(book.previewLink));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Can\'t open link')),
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomSliverHeader extends SliverPersistentHeaderDelegate {
  final Book book;

  CustomSliverHeader({required this.book});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: shrinkOffset > 0
            ? [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 8.0,
                ),
              ]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: ListTile(
          contentPadding: shrinkOffset > 0
              ? const EdgeInsets.only(right: 16.0)
              : const EdgeInsets.symmetric(horizontal: 16.0),
          title: RichText(
            text: TextSpan(
              text: book.title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            book.authors[0],
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          leading: shrinkOffset > 0
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                )
              : null,
          trailing: IconButton(
            icon: Icon(
              Icons.bookmark_border,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight * 1.75;

  @override
  double get minExtent => kToolbarHeight * 1.75;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
