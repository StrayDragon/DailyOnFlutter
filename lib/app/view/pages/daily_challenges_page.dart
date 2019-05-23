import 'package:daily/app/view/components/stacking_cards_view.dart';
import 'package:daily/app/view/components/tag.dart';
import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

class DailyChallengesPage extends StatefulWidget {
  DailyChallengesPage({Key key}) : super(key: key);

  @override
  _DailyChallengesPageState createState() => _DailyChallengesPageState();
}

class _DailyChallengesPageState extends State<DailyChallengesPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily v0.1'),
        centerTitle: true,
      ),
      body: RubberBottomSheet(
        upperLayer: Container(
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
        ),
        lowerLayer: Container(
          constraints: BoxConstraints(),
          decoration: BoxDecoration(
            color: Colors.cyan[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              StackingCardsView(),
              TagExample(),
            ],
          ),
        ),
        animationController: _rubberController,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 12.0,
        onPressed: () {},
      ),
    );
  }

  @override
  void initState() {
    _rubberController = RubberAnimationController(
        vsync: this,
        lowerBoundValue: AnimationControllerValue(pixel: 60),
        upperBoundValue: AnimationControllerValue(percentage: 0.9),
        springDescription: SpringDescription.withDampingRatio(
          mass: 1,
          stiffness: Stiffness.HIGH,
          ratio: DampingRatio.HIGH_BOUNCY,
        ),
        duration: Duration(milliseconds: 300));
    super.initState();
  }

  RubberAnimationController _rubberController;
}
