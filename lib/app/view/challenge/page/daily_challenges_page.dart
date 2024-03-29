import 'package:daily/app/view/challenge/component/challenge_cards.dart';
import 'package:daily/app/view/challenge/components.dart'
    show AddChallengeDialog, ChallengesTimeline;
import 'package:daily/app/view/common/functionals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rubber/rubber.dart';
import 'package:timeline_list/timeline.dart';

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
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "时间线",
                style: TextStyle(fontSize: 32),
              ),
            ),
            Container(
              height: 500,
              child: ChallengesTimeline(
                position: TimelinePosition.Left,
              ),
            ),
          ],
        ),
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
                barrierDismissible: false,
                builder: (BuildContext context) => AddChallengeDialog(),
              ),
            );
          },
        ),
      ),
      body: RubberBottomSheet(
        header: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                height: 7.5,
                top: 2.0,
                width: 80,
                child: Container(
                  color: Colors.white70,
                ),
              ),
              Text(
                "未完成的任务们",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        headerHeight: 100.0,
        lowerLayer: Container(
          constraints: BoxConstraints(),
          decoration: BoxDecoration(
            color: Colors.cyan[100],
          ),
          child: ChallengeCards(),
        ),
        upperLayer: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Container(
            height: 200,
            child: Center(
              child: StaggeredGridView.countBuilder(
                scrollDirection: Axis.horizontal,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                crossAxisCount: 4,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) =>
                    Container(
                      color: colorList[index],
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('$index'),
                        ),
                      ),
                    ),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(
                      2,
                      index.isEven ? 2 : 1,
                    ),
//              mainAxisSpacing: 4.0,
//              crossAxisSpacing: 4.0,
              ),
            ),
          ),
        ),
        animationController: _rubberController,
      ),
    );
  }

  RubberAnimationController _rubberController;

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

  @override
  void dispose() {
    _rubberController.dispose();
    super.dispose();
  }
}

final colorList = [
  Colors.red,
  Colors.white70,
  Colors.white30,
  Colors.amber,
  Colors.deepOrangeAccent,
  Colors.orange,
  Colors.tealAccent,
  Colors.white30,
  Colors.green,
];
