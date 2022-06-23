import 'package:flutter/material.dart';

class PlaceDetailsNavBar extends StatelessWidget {
  const PlaceDetailsNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox.fromSize(
        size: const Size.fromHeight(kToolbarHeight),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FloatingActionButton(
              heroTag: 'Fav',
              elevation: 0.0,
              backgroundColor: const Color(0x30FF0000),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                side: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              child: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {},
            ),
            FloatingActionButton(
              heroTag: 'Discover',
              elevation: 0.0,
              backgroundColor: const Color(0x100000FF),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                side: BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                ),
              ),
              child: const Icon(Icons.explore, color: Colors.blue),
              onPressed: () {},
            ),
            MaterialButton(
              elevation: 0.0,
              color: const Color(0x20FF0070),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                side: BorderSide(
                  color: Color(0xFFFF0070),
                  width: 1.0,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 64.0,
              ),
              child: const Text(
                'BOOK NOW',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF0070),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
