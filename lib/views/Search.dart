import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/views/SearchResults.dart';


class Search extends StatefulWidget {
  @override
  createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, size: 30,),
                ),
                controller: searchController,
                onSubmitted: (searchQuery) => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchResults(searchQuery)),
                ),
              ),
            ),
          ),
          Image.network("https://cdn.freebiesupply.com/images/large/1x/online-shopping-n57.jpg", fit: BoxFit.contain,),
        ],
      )
    );
  }

}
