import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Daily',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _images = [
    "assets/image_04.jpg",
    "assets/image_03.jpg",
    "assets/image_02.jpg",
    "assets/image_01.png",
  ];
  List<String> _titles = [
    "挑战 四: PAT甲级训练",
    "挑战 三: 英语阅读训练",
    "挑战 二: 英语听力训练",
    "挑战 一: 高数12题训练",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StackingCardsWidget(),
      ),
    );
  }
}

List<String> gImages = [
  "assets/image_04.jpg",
  "assets/image_03.jpg",
  "assets/image_02.jpg",
  "assets/image_01.png",
];
List<String> gImageTitles = [
  "挑战 四: PAT甲级训练",
  "挑战 三: 英语阅读训练",
  "挑战 二: 英语听力训练",
  "挑战 一: 高数12题训练",
];

/// TODO:[ Refactor ] Will extract to no side effects component...
class StackingCardsWidget extends StatefulWidget {
  final List<String> backgroundImageUrls;
  final List<String> title;

  StackingCardsWidget({
    Key key,
    this.backgroundImageUrls,
    this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StackingCardsWidgetState();
}

class _StackingCardsWidgetState extends State<StackingCardsWidget> {
  PageController _controller;
  double _currentCards = gImages.length - 1.0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: gImages.length - 1);
    _controller.addListener(() {
      setState(() {
        _currentCards = _controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          StackingCard(_currentCards),
          Positioned.fill(
            top: 20.0,
            left: 20.0,
            right: 80.0,
            bottom: 20.0,
            child: GestureDetector(
              onTap: () {
                debugPrint('tapped card index ${_controller.page.toInt()}');
              },
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: gImages.length,
                controller: _controller,
                reverse: true,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StackingCard extends StatelessWidget {
  static final double cardAspectRatio = 12.0 / 16.0;
  static final double widgetAspectRatio = cardAspectRatio * 1.2;

  final double currentPage;
  static final double padding = 20.0;
  static final double verticalInset = 20.0;

  StackingCard(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        var width = boxConstraints.maxWidth;
        var height = boxConstraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < gImages.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              math.max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          cardList.add(makeCard(delta, start, i));
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }

  Positioned makeCard(double delta, double start, int i) {
    return Positioned.directional(
      top: padding + verticalInset * math.max(-delta, 0.0),
      bottom: padding + verticalInset * math.max(-delta, 0.0),
      start: start,
      textDirection: TextDirection.rtl,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(3.0, 6.0),
                blurRadius: 10.0)
          ]),
          child: AspectRatio(
            aspectRatio: cardAspectRatio,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  gImages[i],
                  fit: BoxFit.cover,
                ),
                Flex(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  direction: Axis.vertical,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        gImageTitles[i], // FIXME:title
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
