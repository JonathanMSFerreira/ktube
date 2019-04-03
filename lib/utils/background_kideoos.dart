
import 'package:flutter/material.dart';

class BackgroundKideoos  {


  Widget setBackKideoos() {

    return   Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 1),
            Color.fromARGB(135, 245, 230, 1),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );
  }
}
