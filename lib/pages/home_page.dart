import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food_finder/pages/search_page.dart';

class HomePage extends StatefulWidget {
    HomePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final myController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text("WanderScout"),
            ),
            body: Container(
                margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                child: Column(
                    children: <Widget>[
                        _searchBar(),
                        _buildSwiper()
                    ],
                ),
            )
        );
    }

    Expanded _buildSwiper() {
        return Expanded(
            child: Swiper(
                itemBuilder: (BuildContext context, int index){
                    return Image.network(
                        "http://via.placeholder.com/700x400",
                        fit: BoxFit.fill,
                    );
                },
                itemCount: 3,
                pagination: SwiperPagination(),
                control: SwiperControl(
                    iconNext: null,
                    iconPrevious: null
                ),
            ),
        );
    }

    Widget _searchBar() {
        return Hero(
            tag: "SearchBar",
            child: Card(
                child: TextField(
                    style: Theme.of(context).textTheme.subhead,
                    controller: myController,
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return SearchPage(myController);
                        }));
                    },
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.subhead,
                        border: InputBorder.none,
                        labelText: "Enter your search string here...",
                        icon: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Icon(
                                Icons.search,
                                color: Theme.of(context).iconTheme.color,
                            ),
                        ),
                    ),
                )
            ),
        );
    }
}