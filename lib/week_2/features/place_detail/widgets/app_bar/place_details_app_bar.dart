import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapp_challenges/week_2/data/models/place.dart';
import 'package:flutter_mapp_challenges/week_2/features/place_detail/widgets/app_bar/place_details_app_bar_place.dart';

class PlaceDetailsAppBar extends StatelessWidget {
  final Place place;

  const PlaceDetailsAppBar({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return SliverAppBar(
      forceElevated: true,
      pinned: true,
      collapsedHeight: kToolbarHeight,
      expandedHeight: height / 1.75,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Theme.of(context).backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
      ),
      leading: Center(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(24.0),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x70000000),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                place.imageUrl,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: PlaceDetailsAppBarPlace(place: place),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
