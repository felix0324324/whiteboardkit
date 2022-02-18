import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whiteboardkit/toolbox_options.dart';
import 'package:whiteboardkit/whiteboardkit.dart';
import 'dart:convert';
// import 'package:image/image.dart' as ImagePackage;

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
  Future<void> initState() {
    // String aImageString = "";
    controller = new DrawingController();
    controller.toolboxOptions = ToolboxOptions(
        toolBarBtnColor: Colors.white,
        toolBarColor: Colors.grey,
        eraser: false,
        thickIcon: CupertinoIcons.scribble,
        colorsIcon: CupertinoIcons.eyedropper,
        clearAllIcon: CupertinoIcons.square_stack_3d_up_slash,
        undoIcon: CupertinoIcons.arrow_uturn_left);

    getImage().then((value) {
      controller.bgImage = value;
    });

    controller.onChange().listen((draw) {
      //do something with it
      // var aBase64 = controller.getBase64();
    });
    super.initState();
  }

  Future<Widget> getImage() async {
    return Image.network(
      // "https://image.winudf.com/v2/image1/Y29tLmxpaGtnLmFwcF9zY3JlZW5fMF8xNTkxMzQyMDk2XzA2Ng/screen-0.jpg?fakeurl=1&type=.jpg", // |
      "https://cache.hkgolden.media/compress/https://img.eservice-hk.net/upload/2018/06/04/203936_c7da2202001ef3739c67954b4c9dbb31.png",
      // "https://na.cx/i/mdGJgZH.png", //
      // "https://static.javatpoint.com/tutorial/flutter/images/flutter-creating-android-platform-specific-code3.png",
      // width: 500,
      fit: BoxFit.fitWidth,
    );
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
