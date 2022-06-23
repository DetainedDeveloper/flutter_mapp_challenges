import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_2/data/models/place.dart';
import 'package:flutter_mapp_challenges/week_2/features/place_detail/widgets/app_bar/place_details_app_bar.dart';
import 'package:flutter_mapp_challenges/week_2/features/place_detail/widgets/place_details_header.dart';
import 'package:flutter_mapp_challenges/week_2/features/place_detail/widgets/place_details_nav_bar.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final Place place;

  const PlaceDetailsScreen({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              PlaceDetailsAppBar(place: place),
            ];
          },
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: PlaceDetailsHeader(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    place.about,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF909090),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const PlaceDetailsNavBar(),
    );
  }
}
