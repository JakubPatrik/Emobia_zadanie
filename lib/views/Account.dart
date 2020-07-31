import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget{
  @override
  createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Account"),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }

}