import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food_finder/pages/home_page.dart';
import 'package:food_finder/pages/search_page.dart';
import 'package:food_finder/pages/search_result_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanderScout',
      theme: ThemeData(
          accentColor: Color.fromARGB(255, 112, 112, 112),
          primaryColor: Color.fromARGB(255, 83, 71, 155),
          textTheme: TextTheme(
              subhead: TextStyle(
                  color: Color.fromARGB(255, 112, 112, 112),
              )
          ),
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 112, 112, 112)
          ),

      ),
      home: SplashScreenPage(title: 'WanderScout'),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
    SplashScreenPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
    @override
    Widget build(BuildContext context) {
        return SplashScreen(
            seconds: 4,
            navigateAfterSeconds: HomePage(),
            image: Image.asset('assets/WanderScoutLogo.jpg'),
            backgroundColor: Colors.white,
            photoSize: 140.0,
            loaderColor: Theme.of(context).primaryColor,
        );
    }
}


