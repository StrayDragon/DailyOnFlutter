import 'package:daily/app/view/components/add_challenge_dialog.dart'
    show AddChallengeDialog;
import 'package:daily/app/view/components/functional_widgets.dart'
    show HeroDialogRoute;
import 'package:daily/app/view/components/timeline.dart';
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
//      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
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
          child: ChallengesTimeline(),
        ),
        animationController: _rubberController,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          right: 10.0,
          bottom: 30.0,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 12.0,
          heroTag: AddChallengeDialog.heroTag,
          onPressed: () {
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (BuildContext context) {
                  return AddChallengeDialog();
                },
              ),
            );
          },
        ),
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
          stiffness: Stiffness.LOW,
          ratio: DampingRatio.MEDIUM_BOUNCY,
        ),
        duration: Duration(milliseconds: 300));
    super.initState();
  }

  RubberAnimationController _rubberController;
}
