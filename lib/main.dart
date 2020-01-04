import 'package:flutter/material.dart';
import 'package:insight3/pages/ar.pages.dart';
import 'package:insight3/pages/choose.pages.dart';

import 'pages/home.pages.dart';

import 'package:flutter/services.dart';

//import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Insight33333',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => ShowingAR(),
        "/CH": (context) => Choice(),
        "/AR": (context) => ShowingAR(),
      },
    );
  }
}
