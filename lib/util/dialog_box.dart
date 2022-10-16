import 'package:flutter/material.dart';
import 'package:to_do_app/util/buttons.dart';

import '../constants.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kTextColor,
      content: Container(
        height: 120,
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task",
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Buttons(onPressed: onSave, text: "Save"),
                SizedBox(
                  width: 10,
                ),
                Buttons(onPressed: onCancel, text: "Cancel"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
