import 'package:flutter/material.dart';

class SpaceAnimationBuilder extends StatefulWidget {
  @override
  _SpaceAnimationBuilderState createState() => _SpaceAnimationBuilderState();
}

class _SpaceAnimationBuilderState extends State<SpaceAnimationBuilder> with SingleTickerProviderStateMixin{

  final backGroundImage = Image.asset("assets/milky_way.jpg", fit: BoxFit.fill,);
  final ufo = Image.asset("assets/ufo.jpg");
  AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        backGroundImage,
        AnimatedBuilder(
          animation: _controller,
          builder: (_,__) => ClipPath(
            clipper: const BeamClipper(),
            child: Container(
              height: 1000,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Colors.yellow,
                      Colors.transparent,
                    ],
                  stops: [0,_controller.value],
                ),
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
