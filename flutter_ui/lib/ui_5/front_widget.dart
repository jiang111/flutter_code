import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FrontWidget extends StatefulWidget {
  Function open;

  FrontWidget(this.open);

  @override
  _FrontWidgetState createState() => _FrontWidgetState();
}

class _FrontWidgetState extends State<FrontWidget>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: widget.open,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 10,
                    ),
                    child: Icon(
                      Icons.menu,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Center(
                      child: Text(
                        "Opendoor",
                        style: TextStyle(
                          color: Color(0xff266ed5),
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    top: 10,
                  ),
                  child: CircleAvatar(
                    child: FlutterLogo(
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Hello Eric",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              color: Color(0xffeaf2f8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  "456 Connections Awe, Phoexin AZ",
                  style: TextStyle(
                    color: Color(0xff266ed5),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: SizedBox(
                height: 40,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.grey,
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text("My house"),
                    ),
                    Tab(
                      child: Text("Market"),
                    ),
                    Tab(
                      child: Text("Tools"),
                    ),
                    Tab(
                      child: Text("Neighbourhood"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _buildContainer(),
                  _buildContainer(),
                  _buildContainer(),
                  _buildContainer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(" "),
      ),
    );
  }
}
