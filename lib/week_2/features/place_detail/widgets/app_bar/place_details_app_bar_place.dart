import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_2/data/models/place.dart';
import 'package:flutter_mapp_challenges/week_2/features/place_detail/widgets/app_bar/place_details_app_bar_profiles.dart';

class PlaceDetailsAppBarPlace extends StatelessWidget {
  final Place place;

  const PlaceDetailsAppBarPlace({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '\$${place.cost}',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: place.place,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
              ),
              TextSpan(
                text: ', ${place.country}',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        const PlaceDetailsAppBarProfiles(),
        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        Text(
          'Sofie, Lauren, Joline + 12 more',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
      ],
    );
  }
}
