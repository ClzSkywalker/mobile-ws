import 'package:flutter/material.dart';
import '../painter/painter.dart';
import '../painter/painterPiece.dart';


class BorderPage extends StatelessWidget {
  const BorderPage({Key? key}) : super(key: key);

  static const checkerboard = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];


  @override
  Widget build(BuildContext context) {
    // 屏幕Size
    final Size screenSize = MediaQuery.of(context).size;
    // 状态栏高度
    final double titlePadding = MediaQuery.of(context).padding.top;
    // 除去状态栏的高度
    final double height = screenSize.height - titlePadding;
    // 本组件高度
    final double realHeight = height * 0.7;
    // 本组件的Size
    final Size basicSize = Size(screenSize.width, realHeight);
    return Column(
      children: <Widget>[
        GestureDetector(
          child: CustomPaint(
              size: basicSize,
              foregroundPainter:
              PiecePainter(checkerboard, screenSize, titlePadding),
              child: CustomPaint(
                size: basicSize,
                foregroundPainter:
                FiveBoardPainter(checkerboard, screenSize, titlePadding),
              )),
        ),
      ],
    );
  }
}
