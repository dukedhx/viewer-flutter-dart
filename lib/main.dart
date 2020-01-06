import 'package:flutter/material.dart';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_flutter_asset/jaguar_flutter_asset.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

final flutterWebviewPlugin = new FlutterWebviewPlugin();

main() async {
  final server = Jaguar();
  server.addRoute(serveFlutterAssets());
  await server.serve();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Autodesk Forge Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Autodesk Forge Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    flutterWebviewPlugin.launch('http://127.0.0.1:8080/',
    rect: new Rect.fromLTWH(
      0.0,
      100.0,
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height - 100,
    ));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
    );
  }
}
