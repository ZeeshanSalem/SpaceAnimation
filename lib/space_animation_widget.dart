import 'package:flutter/material.dart';

class SpaceAnimationWidget extends StatefulWidget {
  @override
  _SpaceAnimationWidgetState createState() => _SpaceAnimationWidgetState();
}

class _SpaceAnimationWidgetState extends State<SpaceAnimationWidget> with SingleTickerProviderStateMixin{

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
        BeamTransition(animation: _controller,)

      ],
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}



class BeamTransition extends AnimatedWidget{
  BeamTransition({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    // TODO: implement build
    return ClipPath(
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
            stops: [0,animation.value],
          ),
        ),
      ),
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
