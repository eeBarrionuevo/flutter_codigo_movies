import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_movies/pages/movie_detail_page.dart';
import 'package:flutter_codigo_movies/widgets/drawer_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List moviesList;

  String image_url = "https://image.tmdb.org/t/p/w500";

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

      body: moviesList != null ? Column(
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
                return GestureDetector(
                  onTap: (){
                    int id = moviesList[index]['id'];
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailPage(id: id,)));
                  },
                  child: Row(
                    children: [
                      Container(
                        child: Container(
                          width: 90.0,
                          height: 90.0,
                        ),
                        margin: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          image: DecorationImage(
                              image: NetworkImage(
                                image_url + moviesList[index]["poster_path"],
                              ),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 7,
                                offset: Offset(2,3)
                            ),
                          ],
                        ),

                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Text(
                                moviesList[index]["original_title"] ?? "",
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star),
                                  Text(moviesList[index]["popularity"].toString())
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                moviesList[index]["overview"],
                                maxLines: 3,
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ): Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<Map> obtenerJson() async {
    String apiKey = "077c6b8e215715b477754b84846c0f95";

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
