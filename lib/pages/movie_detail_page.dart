import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
      body: movieDetail != null ?  NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              expandedHeight: 220.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    movieDetail["original_title"] ?? "",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w500/${movieDetail["backdrop_path"]}",
                        fit: BoxFit.fitWidth,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black12.withOpacity(0),
                                Colors.black12.withOpacity(0.5),
                                Colors.black,
                              ]),
                        ),
                      ),
                    ],
                  )),
            ),
          ];
        },
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/${movieDetail["poster_path"]}",
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieDetail["original_title"],
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          RichText(
                            text: TextSpan(
                              text: movieDetail["release_date"],
                              children: [
                                TextSpan(
                                  text: " / ",
                                ),
                                TextSpan(
                                  text: "${movieDetail["runtime"].toString()} min.",
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Row(
                            children: [Icon(Icons.star), Text(movieDetail["vote_average"].toString())],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [Icon(Icons.thumb_up), Text("Me gusta")],
                    ),
                    Column(
                      children: [Icon(Icons.thumb_down), Text("No me gusta")],
                    ),
                    Column(
                      children: [Icon(Icons.playlist_add), Text("Mi lista")],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  movieDetail["overview"] ?? "",
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Alquilar en HD por 55.00 PE",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Alquilar en HD por 55.00 PE",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ) : Center(child: CircularProgressIndicator(),),
    );
  }
}
