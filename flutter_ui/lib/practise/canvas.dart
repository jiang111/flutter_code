import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math' as Math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  ByteData byteData;

  @override
  void initState() {
    super.initState();

//    UI.PictureRecorder pictureRecorder = UI.PictureRecorder();
//
//    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(300, 300));
//
//    Canvas canvas = Canvas(
//      pictureRecorder,
//      rect,
//    );
//    canvas.drawColor(Colors.red, BlendMode.color);
//
//    UI.Picture picture = pictureRecorder.endRecording();
//
//    picture.toImage(300, 300).then((value) async {
//      byteData = await value.toByteData(format: UI.ImageByteFormat.png);
//      setState(() {});
//    });
  }

  @override
  Widget build(BuildContext context) {
//    if (byteData == null) return Container();

    var paint = CustomPaint(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      painter: MyPainter(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas的各种用法"),
      ),
      body: Container(
//        child: Image.memory(
//          Uint8List.view(byteData.buffer),
//        ),
        child: paint,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //clip系列

    //clipRect

//    canvas.drawRect(
//        Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
//        Paint()..color = Colors.red);
//
//    Rect rect = Rect.fromPoints(Offset(30, 30), Offset(100, 100));
//
//    Rect newRect =
//        rect.intersect(Rect.fromPoints(Offset(80, 80), Offset(150, 150)));
//
//    canvas.clipRect(newRect);
//
//    canvas.drawRect(Rect.fromPoints(Offset(20, 20), Offset(300, 300)),
//        Paint()..color = Colors.green);

    //clipPath
//    Paint paint = Paint()
//      ..color = Colors.green
//      ..strokeWidth = 3
//      ..style = PaintingStyle.stroke;

//    Path path = Path();
//    path.moveTo(100, 100);
//    path.quadraticBezierTo(200, 0, 300, 100);

//    path.cubicTo(200, 200, 300, 0, size.width, 100);
//    path.lineTo(size.width, size.height);
//    path.lineTo(0, size.height);
//    path.close();
//    canvas.clipPath(path);

//    path.arcTo(
//        Rect.fromPoints(Offset(100, 100), Offset(300, 400)), 0, Math.pi, false);

//    path.moveTo(10, 100);
//
//    path.lineTo(120, 200);
//    path.lineTo(150, 20);
//    path.lineTo(180, 120);
//    path.lineTo(200, 10);

//    canvas.drawPath(path, paint);
//    canvas.drawLine(
//        Offset(10, 0), Offset(10, 250), Paint()..color = Colors.red);
//    canvas.drawLine(
//        Offset(10, 250), Offset(size.width, 250), Paint()..color = Colors.red);

//    canvas.drawCircle(Offset(50, 50), 30, Paint()..color = Colors.red);

//    canvas.drawImage(image, p, paint)

    //save ,saveLayer,restore

//    Rect rect = Rect.fromPoints(Offset(200, 200), Offset(300, 300));
//    canvas.drawRect(rect, Paint()..color = Colors.red);
//    canvas.save();
//
//    canvas.rotate(0.2);
//    Rect rect1 = Rect.fromPoints(Offset(200, 200), Offset(300, 300));
//    canvas.drawRect(rect1, Paint()..color = Colors.green);
//    canvas.restore();
//    Rect rect2 = Rect.fromPoints(Offset(250, 250), Offset(300, 300));
//    canvas.drawRect(rect2, Paint()..color = Colors.blue);

    //scale ,translate,

    canvas.save();

    canvas.scale(1.2, 1);
//    canvas.translate(100, 100);

//    canvas.skew(-0.5, 0.4);

    canvas.drawCircle(Offset(200, 200), 50, Paint()..color = Colors.red);

    canvas.restore();


    Path path = Path();
    path.moveTo(100, 100);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}