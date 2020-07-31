import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget{
  @override
  createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Favorites"),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }

}