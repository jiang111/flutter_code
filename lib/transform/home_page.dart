import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.navigation,
              color: Colors.black,
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.black26,
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.black26,
            ),
            title: Text(""),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight,
              left: 30,
            ),
            child: Text(
              "Vacation Day",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: PageViewTransform(),
          )
        ],
      ),
    );
  }
}

class PageViewTransform extends StatefulWidget {
  @override
  _PageViewTransformState createState() => _PageViewTransformState();
}

class _PageViewTransformState extends State<PageViewTransform> {
  List<String> _list = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg"
  ];

  PageController pageController;

  double viewportFraction = 0.8;
  double scaleFraction = 0.8;
  double full_scale = 1.0;
  double page_offset = 0;
  double scale = 0;
  double rotateY = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              page_offset = pageController.page;
              if (pageController.position.haveDimensions) {
                rotateY = double.parse(("0." +
                    page_offset.toString().substring(
                          page_offset.toString().indexOf(".") + 1,
                        )));

                if (rotateY > 0.5) {
                  rotateY = 1 - rotateY;
                }
                rotateY = rotateY.abs().clamp(0.0, 1.0);
              } else {
                rotateY = 0;
              }
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        scale = max(scaleFraction,
            (full_scale - (page_offset - index).abs()) + viewportFraction);

        return Container(
          padding: EdgeInsets.only(
            right: 15,
            bottom: 30,
            top: 100 - scale * 25,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotateY),
            alignment: Alignment.center,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      _list[index],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.none,
                      alignment:
                          Alignment((page_offset - index).abs() * 0.5, 0),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 30,
                      child: AnimatedOpacity(
                        opacity: rotateY == 0 ? 1 : 0,
                        duration: Duration(milliseconds: 100),
                        child: Text(
                          "London",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: _list.length,
    );
  }
}
