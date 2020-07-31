import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pages extends ChangeNotifier{

  final pages = ["Home", "Search", "Cart", "Favorites", "Account"];
  final Map <String, Icon> pageData = {
    "Home" : Icon(Icons.home, color: Colors.black,),
    "Search" : Icon(Icons.search, color: Colors.black,),
    "Cart" : Icon(Icons.shopping_cart, color: Colors.black,),
    "Favorites" : Icon(Icons.favorite_border, color: Colors.black,),
    "Account" : Icon(Icons.person_outline, color: Colors.black,),
  };
  String currentPage = "Home";

  Map<String, Icon> get getPageData => pageData;
  String get getPage => currentPage;
  List get getPages => pages;

  updatePage(String page, BuildContext context){
   debugPrint("========= page updated " + page + " ============");
    this.currentPage = page;
    notifyListeners();
  }

}