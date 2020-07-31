import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///C:/Users/Jakub%20Patrik/Desktop/Emobia_zadanie/myapp/lib/models/pages.dart';
import 'package:myapp/views/Account.dart';
import 'package:myapp/views/Cart.dart';
import 'package:myapp/views/Favorites.dart';
import 'package:myapp/views/Home.dart';
import 'package:myapp/views/Search.dart';
import 'package:provider/provider.dart';

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
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          switch (data.getPage){
            case "Home": return Home();
            case "Search": return Search();
            case "Cart": return Cart();
            case "Favorites": return Favorites();
            case "Account": return Account();
            default : return null;
          }
//          if (data.getPage == "Home") {
//            return Home();
//          }
//          if (data.getPage == "Search") {
//            return Search();
//          }
//          if (data.getPage == "Cart") {
//            return Cart();
//          }
//          if (data.getPage == "Favorites") {
//            return Favorites();
//          }
//          if (data.getPage == "Account") {
//            return Account();
//          }
//          return null;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: Pages().getPageData.entries.map(
          (e) => BottomNavigationBarItem(
            icon: e.value,
            title: Text(e.key, style: TextStyle(color: Colors.black),),
          )
        ).toList(),
        onTap: (index) {
          Provider.of<Pages>(context, listen:false).updatePage(Pages().getPages[index], context);
        },
      ),
    );
  }
}

