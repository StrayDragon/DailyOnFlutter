import 'package:flutter/material.dart';

class ChallengeCard extends StatefulWidget {
  final String challengeGroupTitle;

  ChallengeCard(this.challengeGroupTitle);

  @override
  _ChallengeCardState createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text(
                    "挑战 ${widget.challengeGroupTitle}",
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                width: 300,
                height: 400,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, i) => ListTile(
                        title: Text(
                          "${widget.challengeGroupTitle}的子任务",
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
