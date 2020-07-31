import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget{
  @override
  createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.red.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Favorites', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),),
          SizedBox(height: 50,),
          Image.network("https://thumbs.dreamstime.com/b/buyer-purchasing-products-vector-isometric-illustration-shop-assistant-doing-inventory-customer-choosing-holiday-presents-d-152580523.jpg"),
        ],
      ),
    );
  }

}