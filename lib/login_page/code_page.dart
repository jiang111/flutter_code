import 'package:flutter/material.dart';

class CodePage extends StatefulWidget {
  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Verification code",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Icon(
              Icons.lock,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: BodyPage(),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..cubicTo(size.width / 4 * 3, size.height / 3 * 4, size.width / 4 * 3,
          size.height / 4 * 3, size.width / 2, size.height)
      ..cubicTo(size.width / 4, size.height / 4 * 5, size.width / 4,
          size.height / 3 * 2, 0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  List<String> value = ["-", "-", "-", "-"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildWave(),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            top: 40,
            bottom: 30,
          ),
          child: Text(
            "CONFIRRMATION",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: _buildContainer(
                  value[0],
                  value[0] == "-" ? Colors.white : Colors.indigo,
                ),
              ),
              Expanded(
                child: _buildContainer(
                  value[1],
                  value[1] == "-" ? Colors.white : Colors.indigo,
                ),
              ),
              Expanded(
                child: _buildContainer(
                  value[2],
                  value[2] == "-" ? Colors.white : Colors.indigo,
                ),
              ),
              Expanded(
                child: _buildContainer(
                  value[3],
                  value[3] == "-" ? Colors.white : Colors.indigo,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            top: 10,
          ),
          child: Text(
            "RESEND CODE >",
            style: TextStyle(
              color: Colors.black12,
              fontSize: 14,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          height: 50,
          margin: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onTap: () {
              for (int i = 0; i < value.length; i++) {
                if (value[i] == "-") {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("请先输入验证码"),
                  ));
                  return;
                }
              }

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("提交成功"),
              ));
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  flex: 4,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (list[index] == " ") return;

                  setState(() {
                    if (list[index] == "X") {
                      for (int i = value.length - 1; i < value.length; i--) {
                        if (value[i] != "-") {
                          value[i] = "-";
                          return;
                        }
                      }
                    }

                    for (int i = 0; i < value.length; i++) {
                      if (value[i] == "-") {
                        value[i] = list[index];
                        break;
                      }
                    }
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      list[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: list.length,
          ),
        ),
      ],
    );
  }

  Widget _buildWave() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      child: CustomPaint(
        painter: WavePainter(),
      ),
    );
  }

  Widget _buildContainer(String value, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            color: color == Colors.white ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

List<String> list = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "0",
  " ",
  "X",
];
