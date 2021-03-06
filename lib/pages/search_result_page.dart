import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final _random = new Random();

int next(int min, int max) => min + _random.nextInt(max - min);

class SearchResultPage extends StatefulWidget {
    SearchResultPage({Key key}) : super(key: key);

    @override
    _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
    final myController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                leading: Hero(
                    tag: "S.Pellegrino - Sparkling Water",
                    child: GestureDetector(
                        onTap: () {
                            Navigator.pop(context);
                        },
                        child: Icon(Icons.close)
                    ),
                ),
                centerTitle: true,
                title: Text("S.Pellegrino - Sparkling Water"),
            ),
            body: Container(
                margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                child: ListView(
                    children: <Widget>[
                        _buildListTile(
                            'Aqua d\'or Sparkling Spring Water',
                            'Aqua d\'or kildevand m. blid brus',
                            "http://cdn.lomax.dk/images/t_product_large/v1524134199/produkter/7929230/aqua-dor-kildevand-m-blid-brus-05l-inkl-pant.jpg"
                        ),
                        _buildListTile(
                            'Egekilde Sparkling Water',
                            'Egekilde med mild brus',
                            "https://royalunibrew.dk/wp-content/uploads/2017/05/egekilde_brus_flaske_co2_50_cl_wet-1.png"
                        ),
                        _buildListTile(
                            'Aqua d\'or Sparkling Water with Citrus',
                            'Aqua d\'or vand med citrus og brus',
                            "http://cdn.lomax.dk/images/t_product_large/v1524131559/produkter/3756320/aqua-dor-vand-m-brus-citronlime-05l-inklpant.jpg"
                        ),
                        _buildListTile(
                            'Kildevæld Mineral Water',
                            'Kildevæld mineralvand uden brus',
                            "https://potio.dk/wp-content/uploads/2017/01/Kildev%C3%A6ld75.png"
                        ),
                    ],
                ),
            ),
        );
    }

    Widget _buildListTile(title, subtitle, url) {
        return Card(
            child: ListTile(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SecondRoute();
                    }));
                },
                leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.network(url),
                ),
                title: Text(title),
                subtitle: Text(subtitle),
                trailing: Text(
                    "${next(50, 800)}m away",
                    style: TextStyle(
                        color: Colors.grey
                    ),
                ),
            ),
        );
    }
}


class SecondRoute extends StatelessWidget {
    Completer<GoogleMapController> _controller = Completer();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Aqua d\'or',),
                centerTitle: true,
            ),
            body: ListView(
                children: [
                    Image.asset(
                        'assets/aqua_top.jpg',
                        width: 600,
                        height: 240,
                        fit: BoxFit.cover,
                    ),
                    _buildDescriptionSection(),
                    _buildButtonSection(context),
                ],
            ),
        );
    }

    Widget _buildButtonSection(BuildContext context) {
        var storeLatLng = LatLng(55.7708141, 12.5042006);
        var storeMarker = Marker(
            markerId: MarkerId("Store"),
            infoWindow: InfoWindow(
                title: "Meny - SuperMarket",
                snippet: "You can buy Aqua d'or here.",
            ),
            position: storeLatLng
        );

        return SizedBox(
            width: 300,
            height: 300,
            child: GoogleMap(
                markers: Set.from([
                    storeMarker
                ]),
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: storeLatLng,
                    zoom: 14.4746,
                ),
                tiltGesturesEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                },
            ),
        );
    }

    Container _buildDescriptionSection() {
        return Container(
            padding: const EdgeInsets.all(32),
            child: Row(
                children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    'Lyngby, Copenhagen, Denmark. \n \n'
                                        'Distance: 1.6 KM \n \n'
                                        'Description: Aqua Doer is a famous brand for sparkling water in Denmark.',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 112, 112, 112)
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}