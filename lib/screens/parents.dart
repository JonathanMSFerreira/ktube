import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktube/blocs/favorite_bloc.dart';
import 'package:ktube/blocs/videos_bloc.dart';
import 'package:ktube/models/video.dart';
import 'package:ktube/screens/help.dart';
import 'package:ktube/screens/ktube.dart';
import 'package:ktube/screens/result_search.dart';
import 'package:ktube/screens/selected_videos.dart';
import 'package:ktube/utils/background_kideoos.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Parents extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<VideosBloc>(context);



    return Scaffold(
       appBar: AppBar(

           title:  Image.asset("images/kideoos.png", width: 100,),

            backgroundColor: Colors.black
       ),

        body: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new StaggeredGridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  padding: const EdgeInsets.all(1.0),
                  staggeredTiles: _staggeredTilesVideos(),
                  children: _tilesVideos(context),

                ))

    );
  }




  List<StaggeredTile> _staggeredTilesVideos(){


   return <StaggeredTile>[

      const StaggeredTile.count(4, 3),
      const StaggeredTile.count(3, 2),
      const StaggeredTile.count(1, 1),
      const StaggeredTile.count(1, 1),
      const StaggeredTile.count(4, 1),


   ];

  }


 List<Widget> _tilesVideos(context){

  return  <Widget>[

       _cardBuscaVideos(context),
       _cardFavoritos(context),
       _cardHome(context),
       _cardFechar(context),
       _cardAjuda(context)


   ];

  }

  _cardFavoritos(context){

    return

      GestureDetector(
        child:
        Card(
            elevation: 0.0,
            color: Colors.blue,
            child: Container(

                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child:
                                StreamBuilder<Map<String, Video>>(
                                    stream: BlocProvider.of<
                                        FavoriteBloc>(context)
                                        .outFav,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData)
                                        return Text(
                                          "${snapshot.data.length}",
                                          style: TextStyle(
                                              color:
                                              Colors.white),
                                        );
                                      else
                                        return Container();
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.0),
                                child: Text("Favoritos", style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        ],
                      ),


                  ],
                ))),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SelectedVideos()));
        },);

  }


  _cardBuscaVideos(context){

    return

      GestureDetector(

        child: Card(
            elevation: 0.0,
            color: Colors.green,
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.video_library, color: Colors.white,
                      ),

                    ),
                    Text("Novos Vídeos", style: TextStyle(color: Colors.white,),)
                  ],
                ))),
        onTap: (){

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ResultSearch()));

        },

      );

  }

  _cardFechar(context){


   return
     GestureDetector(
       child:

       Card(
           elevation: 0.0,
           color: Colors.redAccent,
           child: Container(
               padding: EdgeInsets.all(10.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Icon(
                       Icons.close, color: Colors.white,


                   ),
                   Text("Fechar", style: TextStyle(color: Colors.white),)
                 ],
               ))),
       onTap: (){

         SystemNavigator.pop();

       },);
  }

  _cardAjuda(context){


    return
      GestureDetector(
        child:

        Card(
            elevation: 0.0,
            color: Colors.deepPurple,
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.help, color: Colors.white,


                    ),
                    Text("Ajuda", style: TextStyle(color: Colors.white),)
                  ],
                ))),
        onTap: (){

          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => Help()));

        },);
  }


  _cardHome(context){

    return

      GestureDetector(

        child:    Card(
            elevation: 0.0,
            color: Colors.orange,
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Icon(Icons.home, color: Colors.white,
                    ),
                    Text("Voltar", style: TextStyle(color: Colors.white),)
                  ],
                ))),
             onTap: (){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => KTube()));


            },


      )

   ;
  }

}
