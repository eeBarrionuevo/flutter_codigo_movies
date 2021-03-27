import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDetailPage extends StatefulWidget {
  int id;
  MovieDetailPage({this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  var movieDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Iniciando vista detalle...");
    getData();
  }

  Future<Map> getJson() async {
    var apiKey = "077c6b8e215715b477754b84846c0f95";
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/${widget.id}?api_key=$apiKey");
    var response = await http.get(url);
    return json.decode(response.body);
  }

  getData() async {
    movieDetail = await getJson();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false ,
              expandedHeight: 220.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Nombre película"),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network("https://as02.epimg.net/meristation/imagenes/2021/03/23/noticias/1616512421_355291_1616512451_noticia_normal_recorte1.jpg",
                    fit: BoxFit.fitWidth,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          colors: [
                            Colors.black54,
                            Colors.black
                          ]
                        ),
                      ),
                    ),

                  ],
                )
              ),
              
            ),
          ];
        },
        body: Center(child: Text("asdsad"),),
      ),
    );
  }
}
