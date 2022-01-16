import 'dart:ffi' as ffi;
import 'package:call/call.dart';
import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';


typedef FuncNative = ffi.Int32 Function(ffi.Int32, ffi.Int32);
typedef FuncDart = int Function(int, int);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var dll = getDyLibModule(path.join('assets','dll','libadd.dll'));     // use it as images.
    var add = dll.lookupFunction<FuncNative, FuncDart>('add');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(add(1,2).toString()),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
