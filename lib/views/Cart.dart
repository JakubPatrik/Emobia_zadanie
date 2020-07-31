import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget{
  @override
  createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Cart"),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }

}