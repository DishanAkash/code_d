import 'package:code_d/Screen/Add%20code/title.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppbar(mediaData),
      // ignore: prefer_const_constructors
      body: Titlename(),
    );
  }

  AppBar buildAppbar(MediaQueryData mediaData) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      title: Image.asset(
        "assets/appbar.png",
        height: mediaData.size.height * 0.30,
      ),
    );
  }
}
