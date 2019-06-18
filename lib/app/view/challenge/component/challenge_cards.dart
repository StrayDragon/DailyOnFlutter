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
    return Container(
      child: Swiper(
        onTap: (int index) {
          print("$index got it~");
        },
        index: currentIndex,
        onIndexChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        curve: Curves.ease,
        itemHeight: 550.0,
        itemWidth: 400.0,
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
        itemBuilder: (context, i) => ClipRRect(
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
                            "挑战 $i",
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
                          itemBuilder: (ctx, i) => ListTile(
                                title: Text(
                                  "子任务: $i",
                                ),
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
