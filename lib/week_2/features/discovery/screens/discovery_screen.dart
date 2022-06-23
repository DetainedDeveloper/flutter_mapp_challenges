import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_2/data/models/place.dart';
import 'package:flutter_mapp_challenges/week_2/features/discovery/widgets/discovery_app_bar.dart';
import 'package:flutter_mapp_challenges/week_2/features/discovery/widgets/place_list_item.dart';

class DiscoveryScreen extends StatelessWidget {
  final List<Place> places;

  const DiscoveryScreen({
    Key? key,
    required this.places,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiscoveryAppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Discover',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: ' new adventures',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
        subtitle: const Text('More than 50 new adventures'),
        trailing: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          child: SizedBox.fromSize(
            size: const Size.fromRadius(24.0),
            child: Image.network(
              'https://images.pexels.com/users/avatars/154780734/mary-199.jpeg?auto=compress&fit=crop&h=256&w=256',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: places.length,
        itemBuilder: (context, index) => PlaceListItem(place: places[index]),
      ),
    );
  }
}
