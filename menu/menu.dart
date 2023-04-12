import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Color primaryColor = const Color(0xff5A32FE);
Color bgColor = const Color(0xff7C5BFF);

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;
  late Animation<double> containAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    animation = CurvedAnimation(
        parent: controller,
        curve: const Cubic(0.175, 0.95, 0.32, 1.05),
        reverseCurve: const Cubic(0.6, -0.05, 0.735, 0.01));
    containAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
  }

  bool isReversed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return Transform(
                transform: Matrix4.identity()
                  ..rotateZ((isReversed ? 1 : -1) * pi / 8 * _getOffset()),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                            left: 20,
                            top: 15,
                          ),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (controller.isCompleted) {
                                isReversed = true;
                                controller.reverse();
                              } else {
                                isReversed = false;
                                controller.forward();
                              }
                            },
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..rotateZ(pi / 4 * animation.value),
                              child: const Icon(
                                CupertinoIcons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.identity()
                            ..rotateZ(-1 * pi / 2 * animation.value),
                          child: Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            margin: const EdgeInsets.only(
                              left: 90,
                              top: 15,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "Message",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.identity()
                            ..rotateZ(pi / 2 * (1 - animation.value)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.video_camera,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.camera,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.photo,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  double _getOffset() {
    double result = 0;
    if (containAnimation.value > 0.5) {
      result = 1 - containAnimation.value;
    } else {
      result = containAnimation.value;
    }
    return result;
  }
}
