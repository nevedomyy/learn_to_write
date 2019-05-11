import 'package:flutter/material.dart';


class AppPainter extends CustomPainter{
  List<List> _list;
  double _size;

  AppPainter(this._list, this._size);

  @override
  void paint(Canvas canvas, Size size) {
    _list.forEach((item){
      canvas.drawCircle(Offset(item[0], item[1]), _size, Paint()..color = item[2]);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}