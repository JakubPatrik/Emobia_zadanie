import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget{
  @override
  createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.red.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Cart', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),),
          SizedBox(height: 50,),
          Image.network("https://cdn.dribbble.com/users/2279668/screenshots/9011709/media/75d2cfb61226c4311c3d9b13ba2c1ac3.png"),
        ],
      ),
    );
  }

}