import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_movies/widgets/drawer_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var moviesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Iniciando vista Home...");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Movies"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.all_inclusive),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Más valoradas",
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Top Populares",
              style: TextStyle(
                  fontSize: 35.0,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: moviesList == null ? 0 : moviesList.length,
              itemBuilder: (context, index) {
                return Text(moviesList[index]["original_title"]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<Map> obtenerJson() async {
    var apiKey = "077c6b8e215715b477754b84846c0f95";
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey');
    var respuesta = await http.get(url);
    return json.decode(respuesta.body);
  }

  void getData() async {
    var data = await obtenerJson();
    moviesList = data["results"];
    setState(() {});
  }
}
