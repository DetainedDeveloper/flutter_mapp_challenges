import 'package:flutter/material.dart';

class PlaceDetailsHeader extends StatelessWidget {
  const PlaceDetailsHeader({Key? key}) : super(key: key);

  static const Color _color = Color(0xFF909090);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: const [
            Icon(Icons.verified_user, color: _color),
            Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text(
              'Verified\nUser',
              style: TextStyle(color: _color, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox.fromSize(
          size: const Size(1.0, kToolbarHeight * 1.25),
          child: ColoredBox(color: Theme.of(context).dividerColor),
        ),
        Column(
          children: const [
            Icon(Icons.assignment, color: _color),
            Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text(
              'Road Trip\nPlan',
              style: TextStyle(color: _color, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox.fromSize(
          size: const Size(1.0, kToolbarHeight * 1.25),
          child: ColoredBox(color: Theme.of(context).dividerColor),
        ),
        Column(
          children: const [
            Icon(Icons.lunch_dining, color: _color),
            Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text(
              'Breakfast\nIncluded',
              style: TextStyle(color: _color, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
