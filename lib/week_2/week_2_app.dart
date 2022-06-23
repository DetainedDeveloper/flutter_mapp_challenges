import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_2/features/discovery/screens/discovery_screen_body.dart';

class Week2App extends StatelessWidget {
  const Week2App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 2 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        shadowColor: const Color(0xFFD0D0D0),
      ),
      home: const DiscoveryScreenBody(),
      debugShowCheckedModeBanner: false,
    );
  }
}
