import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ChallengeCards extends StatefulWidget {
  ChallengeCards();

  @override
  _ChallengeCardsState createState() => _ChallengeCardsState();
}

class _ChallengeCardsState extends State<ChallengeCards> {
  SwiperController _controller = SwiperController();

  int itemCount = 5;

  int currentIndex = 6;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Container(
      child: Swiper(
        onTap: (int index) {
          print(screenSize);
          print("$index got it~");
        },
        index: currentIndex,
        onIndexChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        curve: Curves.ease,
        itemHeight: screenSize.height * 0.7,
        itemWidth: screenSize.width * 0.95,
        fade: 1.0,
        scale: 0.8,
        viewportFraction: 0.8,
        controller: _controller,
        scrollDirection: Axis.vertical,
        indicatorLayout: PageIndicatorLayout.NONE,
        layout: SwiperLayout.STACK,
        loop: false,
        autoplayDisableOnInteraction: false,
        itemCount: itemCount,
        itemBuilder: (context, i) => ChallengeCard(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ChallengeCard extends StatelessWidget {

  const ChallengeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final innerContainerSize = MediaQuery
        .of(context)
        .size;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text(
                    "挑战 ?",
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Container(
                width: 300,
                height: 400,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, i) =>
                      ListTile(
                        onTap: () => print(innerContainerSize),
                        title: Text(
                          "子任务: ?",
                        ),
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
