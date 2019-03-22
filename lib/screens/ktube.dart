import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:ktube/blocs/favorite_bloc.dart';
import 'package:ktube/models/video.dart';
import 'package:ktube/api.dart';
import 'package:ktube/screens/parents.dart';
import 'package:youtube_player/youtube_player.dart';



class KTube extends StatefulWidget {
  @override
  _KTubeState createState() => _KTubeState();
}

class _KTubeState extends State<KTube> {

  String _id = "7QUtEmBT_-w";

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<FavoriteBloc>(context);





  void  _getIdVideo(String vi){

      setState(() {

        _id = vi;

      });

    }

    return Scaffold(
      appBar: AppBar(
        title:

        GestureDetector(
          child: Container(
            height: 25,
            child: Image.asset("images/yt_logo_rgb_dark.png"),
          ),
          onLongPress: (){

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>Parents())
            );
          },),

        backgroundColor: Colors.black87,

      ),
      body:

      Container(
          margin: EdgeInsets.symmetric(vertical: 1),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only( bottom: 1.0),
                  child: AspectRatio(
                      aspectRatio: 10.0/6.0,
                      child: Container(
                          color: Colors.white,
                          child: YoutubePlayer(

                            context: context,
                            source: _id,
                            quality: YoutubeQuality.LOW,
                            aspectRatio: 16/9,
                            showThumbnail: true,
                              keepScreenOn: true,
                            autoPlay: true,

                          )

                      )
                  ),
                ) ,

                Divider(height: 2.0,),


                Expanded(
                  child:

                  StreamBuilder<Map<String, Video>>(
                      stream: bloc.outFav,
                      initialData: {},
                      builder: (context, snapshot){
                        return ListView(
                          children: snapshot.data.values.map((v){

                            return InkWell(
                                onTap: (){



                                    _getIdVideo(v.id);

//                          FlutterYoutube.playYoutubeVideoById(
//                              apiKey: API_KEY,
//                              videoId: v.id,
//                              autoPlay: true
//
//                          );
                                
                                },

                                child:

                                Container(
                                  padding: EdgeInsets.fromLTRB(1.0, 2.0, 1.0, 2.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 130,
                                        height: 90,
                                        child: Image.network(v.thumb),
                                      ),
                                      Expanded(

                                          child: Column(

                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                v.title, style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold),
                                                maxLines: 2,
                                              ),


                                              Row(

                                                children: <Widget>[

                                                  Text("20/02/2019"),
                                                  Icon(Icons.star, color: Colors.yellow,),
                                                  Icon(Icons.star, color: Colors.yellow,),
                                                  Icon(Icons.star, color: Colors.yellow,),
                                                  Icon(Icons.star, color: Colors.yellow,),
                                                  Icon(Icons.star, color: Colors.yellow,),
                                                ],


                                              )

                                            ],
                                          )
                                      ),
                                      Divider(height: 2.0,)
                                    ],
                                  ),

                                )
                            );
                          }).toList(),
                        );
                      }
                  ),

                )
              ])),

    );
  }


}


