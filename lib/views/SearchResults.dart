import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';
import '../models/pages.dart';

class SearchResults extends StatefulWidget {
  @override
  createState() => _SearchResultsState();
  SearchResults(this.searchQuery);
  final String searchQuery;
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.searchQuery);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black,),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        title: Text(widget.searchQuery.toUpperCase(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xFFe0e0e0),
          child: FutureBuilder<Object>(
            future: http.post(
                'https://api.emobia.com/v1/search',
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  'keyword': widget.searchQuery,
                })),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                int count = fetchData(snapshot.data);
                print(count);
                return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.95*MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height),
                  padding: EdgeInsets.only(top:10),
                  shrinkWrap: true,
                  children: List.generate(count<=products.length ? count : products.length, (index) {
                    return Stack(
                      children: [
                        Card(
                          elevation: 1.0,
                          color:Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, right: 30),
                            child: Column(
                              children: [
                                Image.network(products[index].image),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: Text(
                                        products[index].name, textAlign: TextAlign.center, maxLines: 4,
                                        style: TextStyle(color: Colors.black45, fontSize: 18,)
                                    ),
                                  ),
                                ),
                                Spacer(),
                                products[index].price == products[index].regular_price
                                    ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Center(
                                    child: Text(
                                      products[index].price.toString() + "€",
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                                    : Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          products[index].regular_price.toString() + "€",
                                          style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.lineThrough),
                                        ),
                                        Text(
                                          products[index].price.toString() + "€",
                                          style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        products[index].price != products[index].regular_price
                            ? Positioned(
                          right:10, top: 30,
                          child: Container(height: 25, width: 40, color: Color(0xFFfcd3e3),
                            child: Center(child: Text(
                              '- ${(100*(1 - products[index].price/products[index].regular_price)).toInt()}\%', style: TextStyle(color: Colors.red, fontSize: 14),
                            ),),
                          ),
                        )
                          : SizedBox(height: 1,),
                      ]
                    );
                  }),
                );
              }
              if (snapshot.hasError){
                return Center(
                    child: Column(
                      children: [
                        Icon(Icons.error, size: 50,),
                        Text("Upps... something went wrong",
                          style: TextStyle(fontSize: 28, color: Colors.black),)
                      ],
                    ));
              }
              return Center(child: CircularProgressIndicator(
                strokeWidth: 5.0,
              ));
            }
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: Pages().getPageData.entries.map(
                (e) => BottomNavigationBarItem(
              icon: e.value,
              title: Text(e.key, style: TextStyle(color: Colors.black),),
            )
        ).toList(),
        onTap: (index) {
          Navigator.of(context).pop();
          Provider.of<Pages>(context, listen:false).updatePage(Pages().getPages[index], context);
        },
      ),
    );
  }

  List<Product> products = [];
  int itemCount = 0;

  int fetchData(dynamic response) {
    var data = jsonDecode(response.body);
    List<dynamic> items = data["items"];
    items.forEach((el) => products.add(Product.fromJson(el)));
    return data["productCount"];
  }

}
