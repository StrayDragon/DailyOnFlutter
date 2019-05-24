import 'package:flutter/material.dart';

class _Constant {
  _Constant._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class AddChallengeDialog extends StatefulWidget {
  @override
  _AddChallengeDialogState createState() => _AddChallengeDialogState();
}

class _AddChallengeDialogState extends State<AddChallengeDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    _controller.addListener(() => setState(() {}));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: _Constant.avatarRadius + _Constant.padding,
                bottom: _Constant.padding,
                left: _Constant.padding,
                right: _Constant.padding,
              ),
              margin: EdgeInsets.only(top: _Constant.avatarRadius),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(_Constant.padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(
                    "巴拉拉巴拉拉",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "ok这是测试啊啊啊啊啊啊啊啊啊",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => SimpleDialog(
                                  children: <Widget>[
                                    Text("sadsad"),
                                    Text("sadsad"),
                                    Text("sadsad"),
                                  ],
                                ));
//                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text("确定"),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                    ),
                    onSaved: (val) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (val) {
                      return val.length < 4 ? "密码长度错误" : null;
                    },
                    onSaved: (val) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                    ),
                    onSaved: (val) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (val) {
                      return val.length < 4 ? "密码长度错误" : null;
                    },
                    onSaved: (val) {},
                  ),
                ],
              ),
            ),
            Positioned(
              left: _Constant.padding,
              right: _Constant.padding,
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: _Constant.avatarRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
