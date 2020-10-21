import 'package:flutter/material.dart';

class SpaceAnimation extends StatelessWidget{
  final backGroundImage = Image.asset("assets/milky_way.jpg", fit: BoxFit.fill,);
  final ufo = Image.asset("assets/ufo.jpg");
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        backGroundImage,
        ClipPath(
          clipper: const BeamClipper(),
          child: Container(
            height: 1000,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.5,
                colors: [
                  Colors.yellow,
                  Colors.transparent,
                ]
              ),
            ),
          ),
        ),

      ],
    );
  }
}

class BeamClipper extends CustomClipper<Path>{
  const BeamClipper();

  @override
  getClip(Size size){
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
