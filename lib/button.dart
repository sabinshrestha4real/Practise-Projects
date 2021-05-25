import 'package:flutter/material.dart';

class ButtonPress extends StatelessWidget {
  Function btn;
  ButtonPress(this.btn);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: btn,
      child: Text('Click Me!'),
    );
  }
}
