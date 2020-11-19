import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: RaisedButton(
            color: Colors.yellow,
            child: Center(
              child: Text("Open https://google.com"),
            ),
            onPressed: _openUrl,
          ),
        ),
      ),
    );
  }

  Future<bool> _openUrl() async {
    print("Click");
    final url = "https://www.google.com/";
    if (await canLaunch(url)) {
      final success = await launch(url, webOnlyWindowName: "_blank");
      if (success) {
        return true;
      }
    }
    return false;
  }
}
