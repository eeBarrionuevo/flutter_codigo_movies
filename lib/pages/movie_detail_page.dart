import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {

  int id;
  MovieDetailPage({this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}


class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hola ${widget.id}"),
      ),
    );
  }
}
