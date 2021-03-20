import 'package:aufgabe/pages/login_screen.dart';
import 'package:aufgabe/widgets/opaque_background.dart';
import 'package:aufgabe/pages/table_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: ThemeData(
        //here is defined the properties of the app: Colors. In my case, only colors for a different situation :)
        primarySwatch: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.grey[700]),
        ),
      ),
      home: MyHomePage(),
      routes: {
        //here are certain routers. This makes it easier to navigate between screens using routeName. .
        TablePage.routeName: (ctx) => TablePage(),
      },
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
    final h = MediaQuery.of(context)
        .size
        .height; //define the height size of the device screen
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: OpaqueBackgroundImage(
                  //created a widget that makes the visual style of an opaque image
                  imageUrl:
                      "assets/images/slider.jpg", //downloaded image from the main site of your firma:)
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.white,
                  ))
            ],
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: PlaceContainer(),
              color: Colors.transparent,
              height: h *
                  0.8, //defined optimal position for the authWidget. Somewhere in the middle of main screen.
            ),
          )
        ],
      ),
    );
  }
}
