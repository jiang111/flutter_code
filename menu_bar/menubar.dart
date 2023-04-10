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

//0xff2F2C30
//0xff28252A
//COMPONENTS
//NAVBARS
//CTA SECTIONS
//GALLERIES
//PRICING
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double topOffset = 100;
  double eachOffset = 10;
  double offset = 210;

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = CurvedAnimation(
        parent: controller,
        curve: Cubic(0.175, 0.9, 0.32, 1.1),
        reverseCurve: Cubic(0.6, -0.05, 0.735, 0.02));
  }

  @override
  Widget build(BuildContext context) {
    topOffset = MediaQuery.of(context).size.height / 2 - 50;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          builder: (context, _) {
            return Stack(
              children: [
                Positioned(
                  top: topOffset - eachOffset * 2 + offset * animation.value,
                  left: 60,
                  child: Item(
                    title: "PRICING",
                    icon: CupertinoIcons.command,
                    right: const Icon(
                      CupertinoIcons.right_chevron,
                      size: 16,
                      color: Colors.white,
                    ),
                    scale: _getScale(0.8),
                  ),
                ),
                Positioned(
                  top: topOffset - eachOffset + offset * animation.value / 2,
                  left: 60,
                  child: Item(
                    title: "GALLERIES",
                    icon: CupertinoIcons.command,
                    right: const Icon(
                      CupertinoIcons.right_chevron,
                      size: 16,
                      color: Colors.white,
                    ),
                    scale: _getScale(0.85),
                  ),
                ),
                Positioned(
                  top: topOffset,
                  left: 60,
                  child: Item(
                    title: "CTA SECTIONS",
                    icon: CupertinoIcons.command,
                    right: const Icon(
                      CupertinoIcons.right_chevron,
                      size: 16,
                      color: Colors.white,
                    ),
                    scale: _getScale(0.9),
                  ),
                ),
                Positioned(
                  top: topOffset + eachOffset - offset * animation.value / 2,
                  left: 60,
                  child: Item(
                    title: "NAVBARS",
                    icon: CupertinoIcons.command,
                    right: const Icon(
                      CupertinoIcons.right_chevron,
                      size: 16,
                      color: Colors.white,
                    ),
                    scale: _getScale(0.95),
                  ),
                ),
                Positioned(
                  top: topOffset + eachOffset * 2 - offset * animation.value,
                  left: 60,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (controller.isCompleted) {
                        controller.reverse();
                      } else {
                        controller.forward();
                      }
                    },
                    child: Item(
                      title: "COMPONENTS",
                      icon: CupertinoIcons.command,
                      right: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateZ(pi / 2 * animation.value),
                        child: const Icon(
                          CupertinoIcons.right_chevron,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      scale: 1,
                    ),
                  ),
                ),
              ],
            );
          },
          animation: controller,
        ),
      ),
    );
  }

  double _getScale(double d) {
    if (animation.value == 0) return d;

    double result = animation.value * 1.1;

    if (result < d) {
      result = d;
    }
    if (result > 1) {
      result = 1;
    }
    return result;
  }
}

class Item extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? right;
  final double scale;

  const Item({
    Key? key,
    required this.title,
    required this.icon,
    required this.scale,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff28252A),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              offset: const Offset(-5, 0),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            right ??
                const Icon(
                  CupertinoIcons.right_chevron,
                  size: 16,
                  color: Colors.white,
                ),
          ],
        ),
      ),
    );
  }
}
