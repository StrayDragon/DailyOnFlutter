import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';

class ChallengeCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  final Size _cardSize = Size(350.0, 550.0);

  @override
  Widget build(BuildContext context) {
    return SnapList(
      padding: EdgeInsets.only(
        left: (MediaQuery.of(context).size.width - _cardSize.width) / 2,
      ),
      sizeProvider: (index, data) => _cardSize,
      separatorProvider: (index, data) => Size(10.0, 10.0),
      builder: (context, index, data) {
        return ClipRRect(
          borderRadius: new BorderRadius.circular(16.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFFFFF00), width: 0.5),
              // 边色与边宽度
              color: Colors.lightBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("挑战卡片"),
                Text("挑战卡片"),
                Text("挑战卡片"),
                Text("挑战卡片"),
                Text("挑战卡片"),
                Text("挑战卡片"),
                Text("挑战卡片"),
              ],
            ),
          ),
        );
      },
      count: 3,
    );
  }
}
