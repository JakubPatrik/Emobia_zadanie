import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.red.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),),
          SizedBox(height: 50,),
          Image.network("https://i.pinimg.com/280x280_RS/ce/15/e0/ce15e067e91fe2a9ab2efe836d9fcfaf.jpg"),
        ],
      ),
    );
  }

}