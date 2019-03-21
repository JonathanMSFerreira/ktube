import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:ktube/blocs/favorite_bloc.dart';
import 'package:ktube/models/video.dart';
import 'package:ktube/api.dart';
import 'package:ktube/screens/parents.dart';

class KidsTube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<FavoriteBloc>(context);

    Widget video_actual;



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
    margin: EdgeInsets.symmetric(vertical: 2),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[

    Padding(
        padding: EdgeInsets.all(2.0),
      child: AspectRatio(
          aspectRatio: 10.0/6.0,
          child: Container(
            color: Colors.red,
     //       child: actual_video(API_KEY, "DV_WaKdMVbI")

          )
      ),
    ) ,

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
                          FlutterYoutube.playYoutubeVideoById(
                              apiKey: API_KEY,
                              videoId: v.id,
                              autoPlay: true

                          );

                          print(v.id);


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

 Widget actual_video(API_KEY, video){

   return FlutterYoutube.playYoutubeVideoById(
        apiKey: API_KEY,
        videoId: video,
        autoPlay: true

   );

  }




}