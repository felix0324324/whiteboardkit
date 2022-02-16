import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whiteboardkit/toolbox_options.dart';
import 'package:whiteboardkit/whiteboardkit.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  DrawingController controller;

  @override
  void initState() {
    String aImageString = "";
    controller = new DrawingController();
    controller.toolboxOptions = ToolboxOptions(
        // toolBarColor: Colors.red,
        eraser: false,
        thickIcon: CupertinoIcons.scribble,
        colorsIcon: CupertinoIcons.eyedropper,
        clearAllIcon: CupertinoIcons.square_stack_3d_up_slash,
        undoIcon: CupertinoIcons.arrow_uturn_left);

    controller.bgImage = Image.memory(base64Decode(aImageString));

    controller.onChange().listen((draw) {
      //do something with it
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Whiteboard(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}
