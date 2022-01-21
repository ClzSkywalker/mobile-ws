import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:io';
import 'package:call/call.dart';
import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';

import 'component/gamePage.dart';


typedef FuncNative = ffi.Int32 Function(ffi.Int32);
typedef FuncDart = int Function(int);
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

final DynamicLibrary dll = Platform.isWindows
    ? DynamicLibrary.open("E:\\Flutter\\project\\mobile-ws\\frontend\\ws_client\\assets\\windows\\libadd.dll")
    : DynamicLibrary.open("rPPG.framework/rPPG");

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {// use it as images.
    //var add = dll.lookupFunction<FuncNative, FuncDart>('addBinary');
    var add = dll.lookupFunction<FuncNative, FuncDart>('ClimbStairs');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BorderPage(),//Text(add(5).toString(),style: TextStyle(fontSize: 100),),//
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
