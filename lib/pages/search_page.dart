import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_finder/pages/search_result_page.dart';

class SearchPage extends StatefulWidget {
  final myController;

  SearchPage(this.myController, {Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState(myController);
}

class _SearchScreenState extends State<SearchPage> {
  final myController;

  _SearchScreenState(this.myController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            style: TextStyle(color: Colors.white, fontSize: 22),
            controller: myController,
            autofocus: true,
            decoration: const InputDecoration(
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              hintText: "Enter your search string here...",
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('products').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Loading...');
              default:
                  return ListView(
                      padding: const EdgeInsets.all(8.0),
                      children: snapshot.data.documents.map((DocumentSnapshot document) {
                          return _buildListTile(document['title_en'], document['image']);
                      }).toList(),
                  );
            }
          },
        )
        );
  }

  Widget _buildListTile(title, url) {
    var icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Image.network(url),
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return SearchResultPage();
        }));
      },
      child: ListTile(
        leading: Hero(
          tag: title,
          child: icon,
          flightShuttleBuilder:
              (flightContext, animation, direction, fromContext, toContext) {
            return icon;
          },
        ),
        title: Text(title),
      ),
    );
  }
}
