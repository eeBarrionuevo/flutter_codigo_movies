import 'package:flutter/material.dart';
import 'package:flutter_codigo_movies/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Movies"),
      ),
      drawer: DrawerWidget(),

    );
  }
}

