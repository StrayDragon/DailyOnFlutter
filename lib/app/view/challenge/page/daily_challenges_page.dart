import 'package:daily/app/view/challenge/component/components.dart'
    show AddChallengeDialog, ChallengesTimeline;
import 'package:daily/app/view/widget/widgets.dart';
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
      appBar: AppBar(
        title: Text('Daily v0.1'),
        centerTitle: true,
        actions: <Widget>[Container()],
        automaticallyImplyLeading: false,
      ),
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
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
      body: RubberBottomSheet(
        header: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
        ),
        headerHeight: 100.0,
        upperLayer: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.cyan,
          ),
          child: Container(
            height: 200,
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
        lowerLayer: Container(
          constraints: BoxConstraints(),
          decoration: BoxDecoration(
            color: Colors.cyan[100],
          ),
//          child: ChallengesTimeline(),
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

final colorList = [
  Colors.blue,
  Colors.white70,
  Colors.white30,
  Colors.amber,
  Colors.deepOrangeAccent,
  Colors.orange,
  Colors.tealAccent,
  Colors.white30,
  Colors.blue,
];
