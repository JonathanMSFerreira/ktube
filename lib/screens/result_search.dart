import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:ktube/blocs/videos_bloc.dart';
import 'package:ktube/delegates/data_search.dart';
import 'package:ktube/utils/background_kideoos.dart';
import 'package:ktube/widgets/videotile.dart';

class ResultSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<VideosBloc>(context);



   Future<Null> _searchVideos() async{

      String result = await showSearch(context: context, delegate: DataSearch());
      if(result != null) bloc.inSearch.add(result);

    }

    return Scaffold(

      appBar: AppBar(

        elevation: 0.0,

        backgroundColor: Colors.black87,
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {

              _searchVideos();

            },
          )
        ],
      ),

      body: StreamBuilder(
          stream: bloc.outVideos,
          initialData: [],
          builder: (context, snapshot){
            if(snapshot.hasData)
              return ListView.builder(
                itemBuilder: (context, index){
                  if(index < snapshot.data.length){
                    return VideoTile(snapshot.data[index]);
                  } else if (index > 1){
                    bloc.inSearch.add(null);
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),),
                    );
                  }

                  else {
                    return Center(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                       Icon(Icons.search,size: 100, color: Colors.grey,),
                       Text("Nenhuma pesquisa realizada!", style: TextStyle(color: Colors.grey, fontSize: 20),)

                        ],
                      ));
                  }
                },
                itemCount: snapshot.data.length + 1,
              );
            else
              return Container();
          }
      ),



    );

  }



}
