import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'toolbox_options.dart';
import 'whiteboard_draw.dart';
// import 'package:image/image.dart' as ImagePackage;
// import 'dart:ui' as ui;

typedef void SizeChanged(Size size);

abstract class WhiteboardController {
  final streamController = StreamController<WhiteboardDraw>.broadcast();
  final sizeChangedController = StreamController<Size>.broadcast();

  WhiteboardDraw draw;

  final bool readonly;
  final bool toolbox;
  Image bgImage;
  ToolboxOptions toolboxOptions;

  WhiteboardController({
    @required this.readonly,
    this.toolbox = false,
    this.bgImage,
    this.toolboxOptions = const ToolboxOptions(),
  });

  void initializeSize(double width, double height) {
    if (draw.getScaledSize(width, height) == this.draw.getSize()) return;
    draw.scale(width, height);
    streamController.add(draw.copyWith());
    // print("initializeSize: w=${width} height=${height}");
  }

  WhiteboardDraw getDraw() => draw;

  Stream<WhiteboardDraw> onChange() {
    return streamController.stream;
  }

  Stream<Size> onSizeChange() {
    return sizeChangedController.stream;
  }

  close() {
    streamController?.close();
    sizeChangedController?.close();
  }

  onPanUpdate(Offset position) {}

  onPanEnd() {}
}

class PlayControls {
  Stream<WhiteboardDraw> onComplete() {}

  play() async {}

  skip() {}
}
