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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HorizontalCards(),
      ),
    );
  }
}

final double gCardAspectRatio = 12.0 / 16.0;
final double gWidgetAspectRatio = gCardAspectRatio * 1.2;

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
class HorizontalCards extends StatefulWidget {
  final List<String> backgroundImages;
  final List<String> title;

  HorizontalCards({
    Key key,
    this.backgroundImages,
    this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HorizontalCardsState();
}

class _HorizontalCardsState extends State<HorizontalCards> {
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
          Positioned.fill(
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
          CardScrollWidget(_currentCards),
        ],
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  static final double gCardAspectRatio = 12.0 / 16.0;
  static final double gWidgetAspectRatio = gCardAspectRatio * 1.2;

  final double currentPage;
  final double padding = 20.0;
  final double verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: gWidgetAspectRatio,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
            var width = boxConstraints.maxWidth;
            var height = boxConstraints.maxHeight;

            var safeWidth = width - 2 * padding;
            var safeHeight = height - 2 * padding;

            var heightOfPrimaryCard = safeHeight;
            var widthOfPrimaryCard = heightOfPrimaryCard * gCardAspectRatio;

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

              cardList.add(makeCardView(delta, start, i));
            }
            return Stack(
              children: cardList,
            );
          }),
    );
  }

  Positioned makeCardView(double delta, double start, int i) {
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
            aspectRatio: gCardAspectRatio,
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
