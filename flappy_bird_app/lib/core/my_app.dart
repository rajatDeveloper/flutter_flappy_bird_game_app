import 'package:flappy_bird_app/core/screen/main_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flappy Bird Game',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
