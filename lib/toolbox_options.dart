import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToolboxOptions {
  final Color canvasBGColor;
  final Color toolBarColor;
  final Color toolBarBtnColor;
  final bool thick;
  final bool colors;
  final bool eraser;
  final bool clearAll;
  final bool undo;
  final IconData thickIcon;
  final IconData colorsIcon;
  final IconData eraserIcon;
  final IconData clearAllIcon;
  final IconData undoIcon;

  const ToolboxOptions(
      {this.canvasBGColor = null,
      this.toolBarColor = null,
      this.toolBarBtnColor = Colors.black,
      this.thick = true,
      this.colors = true,
      this.eraser = true,
      this.clearAll = true,
      this.undo = true,
      this.thickIcon = null,
      this.colorsIcon = null,
      this.eraserIcon = null,
      this.clearAllIcon = null,
      this.undoIcon = null});
}
