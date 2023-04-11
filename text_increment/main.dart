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

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getListData(money, money);
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  double money = 100.00;

  List<Pair> list = [];
  bool increment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      double newMoney = money +
                          (double.tryParse(controller.text.toString()) ?? 0);

                      print(".....newMoney${newMoney}");
                      getListData(newMoney, money);

                      money = newMoney;
                      setState(() {});
                    },
                    child: const Text("add"),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      double newMoney = money -
                          (double.tryParse(controller.text.toString()) ?? 0);

                      if (newMoney < 0) {
                        newMoney = 0;
                      }
                      getListData(newMoney, money);

                      money = newMoney;
                      setState(() {});
                    },
                    child: const Text("reduce"),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xff396542),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: list
                          .map((e) => TextScroll(
                                key: UniqueKey(),
                                pair: e,
                                increment: increment,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getListData(double newMoney, double oldMoney) {
    increment = newMoney > oldMoney;
    list.clear();
    list.addAll(calcMoneyState(newMoney, oldMoney));
  }
}

class TextScroll extends StatefulWidget {
  final Pair pair;
  final TextStyle textStyle;
  final bool increment;

  const TextScroll({
    Key? key,
    required this.pair,
    required this.increment,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
  }) : super(key: key);

  @override
  State<TextScroll> createState() => _TextScrollState();
}

class _TextScrollState extends State<TextScroll>
    with SingleTickerProviderStateMixin {
  List<String> list = [];

  double width = 0;
  double height = 0;

  late ScrollController scrollController;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> widthAnimation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    list.clear();
    list.addAll(calcNumbers(widget.pair.start, widget.pair.end));
    Size size = calcTextSize("8", widget.textStyle);
    width = size.width;
    height = size.height;

    scrollController = ScrollController(initialScrollOffset: 0);
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = Tween<double>(begin: 0, end: height * (list.length - 1))
        .animate(animationController);

    if (widget.pair.zero2Full) {
      widthAnimation =
          Tween<double>(begin: 0, end: width).animate(animationController);
    } else if (widget.pair.full2Zero) {
      widthAnimation =
          Tween<double>(begin: width, end: 0).animate(animationController);
    } else {
      widthAnimation =
          Tween<double>(begin: width, end: width).animate(animationController);
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animationController.reset();
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          if (scrollController.hasClients) {
            scrollController.jumpTo(animation.value);
          }
          return Container(
            alignment: Alignment.center,
            width: widthAnimation.value,
            height: height,
            child: IgnorePointer(
              ignoring: true,
              child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.zero,
                reverse: widget.increment,
                itemBuilder: (context, index) {
                  return Text(
                    list[index],
                    style: widget.textStyle,
                  );
                },
                itemCount: list.length,
              ),
            ),
          );
        });
  }
}

class Pair {
  String start;
  String end;
  bool zero2Full;
  bool full2Zero;

  Pair(
    this.start,
    this.end, {
    this.zero2Full = false,
    this.full2Zero = false,
  });
}

List<Pair> calcMoneyState(double newMoney, double oldMoney) {
  List<Pair> list = [];
  String oldMoneyStr = oldMoney.toStringAsFixed(2);
  String newMoneyStr = newMoney.toStringAsFixed(2);

  if (newMoneyStr.toString().length != oldMoneyStr.toString().length) {
    if (newMoneyStr.length > oldMoneyStr.length) {
      oldMoneyStr = oldMoneyStr.padLeft(newMoneyStr.length, "0");
    } else {
      newMoneyStr = newMoneyStr.padLeft(oldMoneyStr.length, "0");
    }
  }
  list.clear();
  for (int i = 0; i < newMoneyStr.length; i++) {
    String start = "";
    String end = "";

    start = oldMoneyStr.toString().split("")[i];
    end = newMoneyStr.toString().split("")[i];
    list.add(Pair(start, end, zero2Full: false, full2Zero: false));
  }

  for (int i = 0; i < list.length; i++) {
    if (list[i].start == "0") {
      list[i].zero2Full = true;
    } else {
      break;
    }
  }
  for (int i = 0; i < list.length; i++) {
    if (list[i].end == "0") {
      list[i].full2Zero = true;
    } else {
      break;
    }
  }

  print("...newMoneyStr.${newMoneyStr} ....${oldMoneyStr}");
  if (oldMoney.toInt() == 0) {
    for (int i = list.length - 4; i < list.length; i++) {
      list[i].zero2Full = false;
    }
  }
  if (newMoney.toInt() == 0) {
    for (int i = list.length - 4; i < list.length; i++) {
      list[i].full2Zero = false;
    }
  }
  return list;
}

List<String> calcNumbers(String s, String e) {
  List<int> datas = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  int start;
  int end;
  List<String> list = [];

  if (s == "." || e == ".") {
    list.add(".");
    return list;
  }

  start = int.tryParse(s) ?? 0;
  end = int.tryParse(e) ?? 0;

  if (start == end) {
    list.add(start.toString());
    return list;
  }
  if (start < end) {
    for (int i = start; i <= end; i++) {
      list.add(i.toString());
    }
  } else {
    for (int i = start; i < datas.length; i++) {
      list.add(i.toString());
    }
    for (int i = 0; i <= end; i++) {
      list.add(i.toString());
    }
  }
  return list;
}

Size calcTextSize(String text, TextStyle textStyle) {
  TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr);
  painter.layout();

  return painter.size;
}
