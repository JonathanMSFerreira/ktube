import 'package:flutter/material.dart';
import 'package:ktube/animation/sprite_painter.dart';
import 'package:ktube/screens/parents.dart';
import 'package:ktube/utils/background_kideoos.dart';



class SpriteButton extends StatefulWidget {
  @override
  SpriteButtonState createState() => new SpriteButtonState();
}

class SpriteButtonState extends State<SpriteButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final backgroundKideoos  =  BackgroundKideoos();

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Stack(

        children: <Widget>[

          backgroundKideoos.setBackKideoos(),


          Center(

            child:  new CustomPaint(
              painter: new SpritePainter(_controller),
              child: new SizedBox(
                  width: 300.0,
                  height: 300.0,
                  child:

                  GestureDetector(
                    child: Image.asset(
                      "images/kideoos.png",
                      height: 60.0,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => Parents()));
                    },
                  ),
              ),
            ),
          ) ,
        ],
      )
    );
  }
}