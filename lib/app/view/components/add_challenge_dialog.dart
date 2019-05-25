import 'package:flutter/material.dart';

class AddChallengeDialog extends StatelessWidget {
  static const String heroTag = "AddChallengeHeroTag";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleDialog(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            // To make the card compact
            children: <Widget>[
              Hero(
                tag: AddChallengeDialog.heroTag,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 32.0,
                  child: Text(
                    "挑战",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => SimpleDialog(
                              children: <Widget>[
                                Text("可以嵌套对话框(Dialog)"),
                                Text("!看了源码知道原来是利用Navigator::push实现的"),
                                Text("233333333333333333"),
                              ],
                            ));
                  },
                  child: Text("确定"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
