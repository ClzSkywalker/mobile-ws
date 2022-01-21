import 'package:flutter/material.dart';

// 绘制棋盘
class FiveBoardPainter extends CustomPainter {
  final List<List<int>> checkerboard;
  final Size screenSize;
  final double titlePadding;

  FiveBoardPainter(this.checkerboard, this.screenSize, this.titlePadding);

  @override
  void paint(Canvas canvas, Size size) {
    // 棋盘行数
    final int rows = checkerboard.length;
    // 棋盘列数
    final int columns = checkerboard[0].length;
    // 棋盘区域高度
    final height = (screenSize.height - titlePadding) * 0.7;
    // 绘制 起点 X
    final pos_X = screenSize.width / columns / 2;
    // 绘制 起点 Y
    final pos_Y = height / rows / 2;

    // 绘制棋盘
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 1;

    for (var i = 0; i < rows; i += 1) {
      canvas.drawLine(Offset(pos_X, pos_Y + pos_Y * 2 * i),
          Offset(screenSize.width - pos_X, pos_Y + pos_Y * 2 * i), paint);
    }

    for (var i = 0; i < columns; i += 1) {
      canvas.drawLine(Offset(pos_X + pos_X * 2 * i, pos_Y),
          Offset(pos_X + pos_X * 2 * i, height - pos_Y), paint);
    }

    canvas.drawCircle(
        Offset(pos_X + pos_X * 2 * (columns ~/ 2),
            pos_Y + pos_Y * 2 * (rows ~/ 2)),
        4,
        paint);
  }

  bool shouldRepaint(FiveBoardPainter oldDelegate) => false;

  bool shouldRebuildSemantics(FiveBoardPainter oldDelegate) => false;
}
