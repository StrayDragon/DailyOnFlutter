import 'package:daily/app/view/challenge/component/challenge_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

List<String> gImages = [
	"assets/image_04.jpg",
	"assets/image_03.jpg",
	"assets/image_02.jpg",
	"assets/image_01.png",
];

class StackingCards extends StatefulWidget {
	StackingCards();

	@override
	_StackingCardsState createState() => _StackingCardsState();
}

class _StackingCardsState extends State<StackingCards> {
	int _itemCount;

	bool _loop;

	bool _autoPlay;

	int _autoPlayDely;

	// ignore: unused_field
	double _padding;

	bool _outer;

	double _radius;

	double _viewportFraction;

	SwiperLayout _layout;

	int _currentIndex;

	double _scale;

	Axis _scrollDirection;

	Curve _curve;

	double _fade;

	bool _autoPlayDisableOnInteraction;

	CustomLayoutOption customLayoutOption;

	SwiperController _controller;

	@override
	void initState() {
		_fade = 1.0;
		_currentIndex = 0;
		_curve = Curves.ease;
		_scale = 0.8;
		_controller = SwiperController();
		_layout = SwiperLayout.STACK;
		_radius = 10.0;
		_padding = 0.0;
		_loop = false;
		_itemCount = 5;
		_autoPlay = false;
		_autoPlayDely = 3000;
		_viewportFraction = 0.8;
		_outer = false;
		_scrollDirection = Axis.vertical;
		_autoPlayDisableOnInteraction = false;
		super.initState();
	}

	Widget _buildItem(BuildContext context, int index) {
//    return ClipRRect(
//      borderRadius: BorderRadius.all(new Radius.circular(_radius)),
//      child: Image.asset(
//        gImages[index % gImages.length],
//        fit: BoxFit.fill,
//      ),
//
//    );

		return ChallengeCard(index.toString());
	}

	@override
	Widget build(BuildContext context) {
		return Container(
			child: Swiper(
				onTap: (int index) {
					print("$index got it~");
//          Navigator.of(context).push(
//            MaterialPageRoute(
//              builder: (BuildContext context) {
//                return Scaffold(
//                  appBar: AppBar(
//                    title: Text("New page"),
//                  ),
//                  body: Container(),
//                );
//              },
//            ),
//          );
				},
				fade: _fade,
				index: _currentIndex,
				onIndexChanged: (int index) {
					setState(() {
						_currentIndex = index;
					});
				},
				curve: _curve,
				scale: _scale,
				controller: _controller,
				layout: _layout,
				outer: _outer,
				itemHeight: 550.0,
				itemWidth: 400.0,
				viewportFraction: _viewportFraction,
				autoplayDelay: _autoPlayDely,
				loop: _loop,
				autoplay: _autoPlay,
				itemBuilder: _buildItem,
				itemCount: _itemCount,
				scrollDirection: _scrollDirection,
				indicatorLayout: PageIndicatorLayout.NONE,
				autoplayDisableOnInteraction: _autoPlayDisableOnInteraction,
			),
		);
	}
}
