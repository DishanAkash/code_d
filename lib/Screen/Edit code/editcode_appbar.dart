import 'package:code_d/Screen/Edit%20code/editcode_title.dart';
import 'package:flutter/material.dart';

class EditBar extends StatelessWidget {
  const EditBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppbar(mediaData),
      // ignore: prefer_const_constructors
      body: EditcodetitleName(),
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
