import 'package:flutter/material.dart';
import 'package:space_animation/space_animation.dart';
import 'package:space_animation/space_animation_builder.dart';
import 'package:space_animation/space_animation_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SpaceAnimationWidget(),
    );
  }
}



