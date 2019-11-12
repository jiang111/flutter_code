import 'package:flutter/material.dart';
import 'package:flutter_speedcode/sliver1/home_page.dart' as SliverHomePage;
import 'package:flutter_speedcode/login_page/home_page.dart' as LoginPage;
import 'package:flutter_speedcode/transform/home_page.dart' as Transform;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _list = [
      "assets/images/show1.jpg",
      "assets/images/show2.png",
      "assets/images/show3.png"
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter SpeedCode"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){

                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SliverHomePage.HomePage();
                    },
                  ));
                }else if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return LoginPage.HomePage();
                    },
                  ));
                }else if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Transform.HomePage();
                    },
                  ));
                }



              },
              child: Container(
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: Image.asset(
                    _list[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          itemCount: _list.length,
        ),
      ),
    );
  }
}
