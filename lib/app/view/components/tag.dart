import 'package:flutter/material.dart';

enum TagLevels {
  urgent,
  important,
  easy,
  medium,
  hard,
}

class _Level {
  final TagLevels level;

  _Level(this.level);

  String get title {
    String _title;

    switch (level) {
      case TagLevels.urgent:
        _title = '急切';
        break;
      case TagLevels.important:
        _title = '重要';
        break;
      case TagLevels.easy:
        _title = '简单';
        break;
      case TagLevels.medium:
        _title = '中等';
        break;
      case TagLevels.hard:
        _title = '困难';
        break;
    }

    return _title;
  }

  Color get color {
    Color _color;
    switch (level) {
      case TagLevels.urgent:
        _color = Colors.red;
        break;
      case TagLevels.important:
        _color = Colors.yellow;
        break;
      case TagLevels.easy:
        _color = Colors.greenAccent;
        break;
      case TagLevels.medium:
        _color = Colors.amber;
        break;
      case TagLevels.hard:
        _color = Colors.redAccent;
        break;
    }
    return _color;
  }
}

// ignore: must_be_immutable
class Tag extends StatelessWidget {
  _Level _level;

  Tag({Key key, TagLevels level}) : super(key: key) {
    _level = _Level(level);
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        _level.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: _level.color,
    );
  }
}
