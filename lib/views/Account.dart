import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget{
  @override
  createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.red.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Account Settings', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),),
          SizedBox(height: 50,),
          Image.network("https://i.pinimg.com/280x280_RS/ce/15/e0/ce15e067e91fe2a9ab2efe836d9fcfaf.jpg"),
        ],
      ),
    );
  }

}