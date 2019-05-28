import 'package:flutter/material.dart';

class AddChallengeDialog extends StatefulWidget {
  static const String heroTag = "AddChallengeHeroTag";

  @override
  _AddChallengeDialogState createState() => _AddChallengeDialogState();
}

class _AddChallengeDialogState extends State<AddChallengeDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
							Radius.circular(32.0),
						)),
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
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        debugPrint("OK");
                      }
                    },
                    child: Text('提交'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
