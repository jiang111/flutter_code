import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;

class HomeLeftWidget extends StatefulWidget {
  @override
  _HomeLeftWidgetState createState() => _HomeLeftWidgetState();
}

class _HomeLeftWidgetState extends State<HomeLeftWidget>
    with TickerProviderStateMixin {
  List<String> _list = [
    "My Profile",
    "Notifcation",
    "Invocation",
    "Home",
  ];

  List<GlobalKey> _key = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  int checkIndex = 3;
  Offset checkOffset = Offset(0, 0);
  Offset lastcheckOffset = Offset(0, 0);
  Offset animationOffset = Offset(0, 0);
  Animation _animation;
  bool finishAnimated = false;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then((value) {
      calcuteOffset();
      addAnimation();
    });
  }

  void addAnimation() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ))
      ..addListener(() {
        setState(() {
          animationOffset = Offset(checkOffset.dx, _animation.value);
        });
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          setState(() {
            finishAnimated = true;
          });
        } else {
          finishAnimated = false;
        }
      });

    _animation = Tween(begin: lastcheckOffset.dy, end: checkOffset.dy).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutBack));
    _animationController.forward();
  }

  void calcuteOffset() {
    RenderBox renderBox = _key[checkIndex].currentContext.findRenderObject();
    lastcheckOffset = checkOffset;

    checkOffset = renderBox.localToGlobal(Offset(0, 0));

    checkOffset = Offset(checkOffset.dx + renderBox.size.width,
        checkOffset.dy + renderBox.size.height / 4 * 3);

    print(checkOffset.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: CheckPainter(animationOffset),
        child: Container(
          margin: EdgeInsets.only(right: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffED305A),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      key: _key[0],
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (checkIndex == 0) return;
                            checkIndex = 0;
                            calcuteOffset();
                            addAnimation();
                          });
                        },
                        child: VerticalTextWidget(
                            _list[0], checkIndex == 0 && finishAnimated),
                      ),
                    ),
                    Expanded(
                      key: _key[1],
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (checkIndex == 1) return;
                            checkIndex = 1;
                            calcuteOffset();
                            addAnimation();
                          });
                        },
                        child: VerticalTextWidget(
                            _list[1], checkIndex == 1 && finishAnimated),
                      ),
                    ),
                    Expanded(
                      key: _key[2],
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (checkIndex == 2) return;
                            checkIndex = 2;
                            calcuteOffset();
                            addAnimation();
                          });
                        },
                        child: VerticalTextWidget(
                            _list[2], checkIndex == 2 && finishAnimated),
                      ),
                    ),
                    Expanded(
                      key: _key[3],
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (checkIndex == 3) return;
                            checkIndex = 3;
                            calcuteOffset();
                            addAnimation();
                          });
                        },
                        child: VerticalTextWidget(
                          _list[3],
                          checkIndex == 3 && finishAnimated,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                        bottom: 50,
                      ),
                      child: Icon(
                        Icons.map,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                CustomPaint(
                  painter: PointPainter(animationOffset),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PointPainter extends CustomPainter {
  Offset animationOffset;

  PointPainter(this.animationOffset);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xffED305A);
    paint.style = PaintingStyle.fill;
    final startAngle = -math.pi / 2;
    final sweepAngle = math.pi;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(animationOffset.dx - 10, animationOffset.dy),
            radius: 35),
        startAngle,
        sweepAngle,
        false,
        paint);
    paint.color = Color(0xff991930);

    canvas.drawCircle(Offset(animationOffset.dx, animationOffset.dy), 3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class VerticalTextWidget extends StatelessWidget {
  String text;
  bool checked;

  VerticalTextWidget(this.text, this.checked);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          text,
          style: TextStyle(
            color: checked ? Color(0xff991930) : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class CheckPainter extends CustomPainter {
  Offset offset;

  CheckPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
//    var paint = Paint()
//      ..color = Colors.redAccent
//      ..style = PaintingStyle.fill;
//
//    canvas.drawCircle(Offset(0, offset.dy), 70, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
