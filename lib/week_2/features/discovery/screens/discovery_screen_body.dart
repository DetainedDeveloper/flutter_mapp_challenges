import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_2/data/models/place.dart';
import 'package:flutter_mapp_challenges/week_2/features/discovery/screens/discovery_screen.dart';

class DiscoveryScreenBody extends StatelessWidget {
  const DiscoveryScreenBody({Key? key}) : super(key: key);

  Future<List<dynamic>> parseData(BuildContext context) async {
    List<dynamic> rawData = await json.decode(
      await DefaultAssetBundle.of(context).loadString('assets/data/places.json'),
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
              if (snapshot.hasData && snapshot.data != null) {
                List<Place> places = List.from(
                  snapshot.data!.map((data) => Place.fromJson(data)),
                );

                return DiscoveryScreen(places: places);
              } else {
                return const Center(child: Text('Home is the best place ❤️'));
              }
          }
        },
      ),
    );
  }
}
