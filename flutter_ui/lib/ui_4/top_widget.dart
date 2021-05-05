import 'package:flutter/material.dart';

class TopWidget extends StatefulWidget {
  GlobalKey sizeKey;

  TopWidget(this.sizeKey);

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: widget.sizeKey,
      padding: const EdgeInsets.only(top: kToolbarHeight, left: 100),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff6187E7),
              Color(0xff9F96E0),
              Color(0xffD7A7DA),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 15,
                  ),
                  child: Text(
                    "My personal\nprepaid card",
                    style: TextStyle(
                      height: 1.5,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 130,
                    top: 20,
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 20,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "BALANCE\n",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: "\$ 3.516,",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: "32",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
