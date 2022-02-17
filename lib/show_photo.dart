import 'package:flutter/material.dart';

class ShowPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Slide'),
      ),
      body: Container(),
    );
  }
}
