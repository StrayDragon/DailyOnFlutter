import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class FakeChallenge {
  String name;
  String start;
  String end;

  String predictionDuration = "20min";

  FakeChallenge(this.name, this.start, this.end);
}

List<FakeChallenge> _challenges = [
  FakeChallenge("洗脸", "7:00AM", "7:20AM"),
  FakeChallenge("洗脸", "7:00AM", "7:20AM"),
  FakeChallenge("洗脸", "7:00AM", "7:20AM"),
  FakeChallenge("洗脸", "7:00AM", "7:20AM"),
  FakeChallenge("洗脸", "7:00AM", "7:20AM"),
  FakeChallenge("洗脸", "7:00AM", "7:20AM"),
  FakeChallenge("洗脸", "7:00AM", "7:20AM"),
  FakeChallenge("洗脸", "7:00AM", "7:20AM"),
];

class ChallengesTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Timeline.builder(
        physics: BouncingScrollPhysics(),
        position: TimelinePosition.Center,
        itemCount: _challenges.length,
        itemBuilder: (ctx, i) => TimelineModel(
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => Scaffold(
                            body: Center(
                              child: Text(
                                "From index: $i",
                                style: TextStyle(fontSize: 32.0),
                              ),
                            ),
                          ),
                    ),
                  );
                },
                child: Card(
//                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text("${_challenges[i].start} - ${_challenges[i].end}"),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          _challenges[i].name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              isFirst: i == 0,
              isLast: i == _challenges.length,
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              iconBackground: Colors.purple,
              position: i % 2 == 0
                  ? TimelineItemPosition.right
                  : TimelineItemPosition.left,
            ),
      ),
    );
  }
}
