import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:ktube/blocs/favorite_bloc.dart';
import 'package:ktube/blocs/videos_bloc.dart';
import 'package:ktube/screens/ktube.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
      child: BlocProvider(
        bloc: FavoriteBloc(),
          child: MaterialApp(
            title: 'KidsTube',
            debugShowCheckedModeBanner: false,
            home: KTube(),
          ),
      )
    );
  }
}

