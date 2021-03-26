import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://image.freepik.com/free-vector/colorful-abstract-wallpaper-design_23-2148467625.jpg")
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/845457/pexels-photo-845457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
                  ),
                  radius: 30,
                ),
                Text("Benito Lopez Guzman", style: TextStyle(fontSize: 18.0),),
                Text("Administrador", style: TextStyle(fontSize: 12.0, color: Colors.white),),
              ],
            ),
          ),
          ListTile(
            title: Text("Películas"),
            trailing: Icon(Icons.local_movies),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            title: Text("Televisión"),
            trailing: Icon(Icons.live_tv),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            title: Text("Cerrar Sesión"),
            trailing: Icon(Icons.close),
            onTap: (){

            },
          ),
          Divider()
        ],
      ),
    );
  }
}
