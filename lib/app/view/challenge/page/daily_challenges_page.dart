import 'package:daily/app/view/challenge/component/components.dart'
    show AddChallengeDialog, ChallengesTimeline;
import 'package:daily/app/view/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/hidden_drawer/screen_hidden_drawer.dart';
import 'package:hidden_drawer_menu/menu/item_hidden_menu.dart';
import 'package:rubber/rubber.dart';
import 'package:timeline_list/timeline.dart';

class DailyChallengesPage extends StatefulWidget {
  DailyChallengesPage({Key key}) : super(key: key);

  @override
  _DailyChallengesPageState createState() => _DailyChallengesPageState();
}

class _DailyChallengesPageState extends State<DailyChallengesPage>
    with SingleTickerProviderStateMixin {
  List<ScreenHiddenDrawer> pages = [];

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: pages,
      backgroundColorMenu: Colors.cyan[100],
      slidePercent: 70.0,
      contentCornerRadius: 40.0,
      backgroundColorAppBar: Colors.blueAccent,
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
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

    pages.add(new ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "挑战",
          colorLineSelected: Colors.blueAccent,
          baseStyle:
          TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
          selectedStyle: TextStyle(color: Colors.blue),
        ),
        Container(
          color: Colors.teal,
          child: Scaffold(
            //      resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: false,
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
                      builder: (BuildContext context) {
                        return AddChallengeDialog();
                      },
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
                child: StackingCards(),
              ),
              upperLayer: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  height: 200,
                  child: StaggeredGridView.countBuilder(
                    scrollDirection: Axis.horizontal,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    shrinkWrap: true,
                    padding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
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
              animationController: _rubberController,
            ),
          ),
        )));

    super.initState();
  }

  RubberAnimationController _rubberController;
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
