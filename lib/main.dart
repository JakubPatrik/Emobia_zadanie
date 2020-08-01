import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/views/Account.dart';
import 'package:myapp/views/Cart.dart';
import 'package:myapp/views/Favorites.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Search.dart';
import 'package:provider/provider.dart';

import 'models/pages.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Pages(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(
      title: 'Topankovo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black,),
            tooltip: 'Filter',
            onPressed: () {},
          ),
        ],
        title: Text("Topankovo", style: TextStyle(color: Colors.black),),
      ),
      body: Consumer<Pages>(
        builder: (context, data, child) {
          switch (data.getPage) {
            case "Home":
              return Home();
            case "Search":
              return Search();
            case "Cart":
              return Cart();
            case "Favorites":
              return Favorites();
            case "Account":
              return Account();
            default :
              return null;
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: Pages().getPageData.entries.map(
          (e) => BottomNavigationBarItem(
            icon: e.value,
            title: Text('', style: TextStyle(color: Colors.red, fontSize: 0),),
          )
        ).toList(),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Provider.of<Pages>(context, listen:false).updatePage(Pages().getPages[index], context);
        },
        selectedIconTheme: IconThemeData(size: 35),
        unselectedItemColor: Colors.white10,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}

