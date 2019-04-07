import 'package:flutter/material.dart';
import 'package:food_finder/pages/search_result_page.dart';

class SearchPage extends StatefulWidget {
    final myController;

    SearchPage(this.myController, {Key key}) : super(key: key);

    @override
    _SearchScreenState createState() => _SearchScreenState(myController);
}

class _SearchScreenState extends State<SearchPage>  {
    final myController;

    _SearchScreenState(this.myController);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: TextField(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22
                    ),
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
            body: ListView(
                padding: const EdgeInsets.all(8.0),
                children: ListTile.divideTiles(
                    tiles: [
                        _buildListTile('S.Pellegrino - Spring Water', 'https://www.realfoods.co.uk/ProductImagesID/24343_1.jpg'),
                        _buildListTile('S.Pellegrino - Sparkling Water', 'https://target.scene7.com/is/image/Target/GUEST_bf065c33-205c-458a-8663-dda94da941ef?wid=488&hei=488&fmt=pjpeg'),
                        _buildListTile('S.Pellegrino - Limonata', 'https://cdn1.bigcommerce.com/server2300/a19e4/products/2750/images/3863/8002270146503__17149.1484669436.1280.1280.jpg?c=2')
                    ],
                    context: context,
                ).toList(),
            ),
        );
    }

    Widget _buildListTile(title, url) {
        var icon = CircleAvatar(
            backgroundColor: Colors.blue,
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
                    flightShuttleBuilder: (flightContext, animation, direction,
                        fromContext, toContext) {
                        return icon;
                    },
                ),
                title: Text(title),
            ),
        );
    }
}

