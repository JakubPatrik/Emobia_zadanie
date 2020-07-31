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
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search),
          ),
          autofocus: true,
          controller: searchController,
          onSubmitted: (searchQuery) => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchResults(searchQuery)),
          ),
        )
      ),
    );
  }

}
