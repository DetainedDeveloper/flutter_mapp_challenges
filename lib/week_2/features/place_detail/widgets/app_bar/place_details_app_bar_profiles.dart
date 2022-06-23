import 'package:flutter/material.dart';

class PlaceDetailsAppBarProfiles extends StatelessWidget {
  const PlaceDetailsAppBarProfiles({Key? key}) : super(key: key);

  static final _profileImages = [
    'https://i.pravatar.cc/150?img=36',
    'https://i.pravatar.cc/150?img=30',
    'https://i.pravatar.cc/150?img=24',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(kToolbarHeight),
      child: Stack(
        children: List.generate(
          _profileImages.length,
              (index) => Positioned(
            left: index * 24.0,
            child: SizedBox.fromSize(
              size: const Size.fromRadius(24.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(_profileImages[index]),
                  ),
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
