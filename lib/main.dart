import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

const testDevice = 'No Device';
const kInterstatialId = 'ca-app-pub-3940256099942544/1033173712';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: kInterstatialId,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            createInterstitialAd()
              ..load()
              ..show();
          },
        ),
      ),
    );
  }
}
