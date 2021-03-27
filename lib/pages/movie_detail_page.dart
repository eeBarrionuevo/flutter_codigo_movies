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
      body: Center(
        child: movieDetail != null
            ? Text("Hola ${movieDetail["original_title"]}")
            : CircularProgressIndicator(),
      ),
    );
  }
}
