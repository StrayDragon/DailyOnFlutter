import 'dart:math' as math;

import 'package:daily/testing_my_widget.dart';
import 'package:flutter/material.dart';

/// TODO:[ Refactor ] Will extract to no side effects component...
class StackingCardsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StackingCardsViewState();
}

List<String> gImages = [
  "assets/image_04.jpg",
  "assets/image_03.jpg",
  "assets/image_02.jpg",
  "assets/image_01.png",
];

class _StackingCardsViewState extends State<StackingCardsView> {
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
          _StackingCardsView(_currentCards),
          Positioned.fill(
            top: 20.0,
            left: 20.0,
            right: 80.0,
            bottom: 20.0,
            child: GestureDetector(
              onTap: () {
                debugPrint('tapped card index ${_controller.page.toInt()}');
                Navigator.of(context)
                    .pushNamed(TestingWidgetHomePage.ROUTE_NAME);
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

class _StackingCardsView extends StatelessWidget {
  static final double cardAspectRatio = 12.0 / 16.0;
  static final double widgetAspectRatio = cardAspectRatio * 1.2;

  final double currentPage;
  static final double padding = 20.0;
  static final double verticalInset = 20.0;

  static final List<String> title = [
    "挑战 四: PAT甲级训练",
    "挑战 三: 英语阅读训练",
    "挑战 二: 英语听力训练",
    "挑战 一: 高数12题训练",
  ];

  _StackingCardsView(this.currentPage);

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

  Widget makeCard(double delta, double start, int i) {
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
                        title[i], // FIXME: title
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
