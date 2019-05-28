import 'package:flutter/material.dart';

class TagLevels {
  String name;
  Color color;

  TagLevels({this.name, this.color});

  static get urgent => TagLevels(name: '急切', color: Colors.red);

  static get important => TagLevels(name: '重要', color: Colors.yellow);

  static get easy => TagLevels(name: '简单', color: Colors.greenAccent);

  static get medium => TagLevels(name: '中等', color: Colors.amber);

  static get hard => TagLevels(name: '困难', color: Colors.redAccent);
}

// ignore: must_be_immutable
class Tag extends StatelessWidget {
  VoidCallback onPressed;
  TagLevels level;

  Tag({Key key, this.level, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      label: Text(
        level.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: level.color,
    );
  }
}

class TagExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Tag(
          level: TagLevels.easy,
          onPressed: () => print("Tapped Tag(TagLevels.easy)"),
        ),
        Tag(
          level: TagLevels.medium,
          onPressed: () => print("Tapped Tag(TagLevels.medium)"),
        ),
        Tag(
          level: TagLevels.hard,
          onPressed: () => print("Tapped Tag(TagLevels.hard)"),
        ),
        Tag(
          level: TagLevels.important,
          onPressed: () => print("Tapped Tag(TagLevels.important)"),
        ),
        Tag(
          level: TagLevels.urgent,
          onPressed: () => print("Tapped Tag(TagLevels.urgent)"),
        ),
      ],
    );
  }
}
