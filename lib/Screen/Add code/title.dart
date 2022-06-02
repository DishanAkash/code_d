import 'package:code_d/Screen/Add%20code/add_code.dart';
import 'package:flutter/material.dart';

class Titlename extends StatelessWidget {
  const Titlename({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Customer(),
            const SizedBox(
              height: 20,
            ),
            Addcode(),
          ],
        ),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class Customer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.65,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: const [
                        Text(
                          "Add Code",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset("assets/icon_code.jpg",
                      fit: BoxFit.cover, alignment: Alignment.center),
                )
              ],
            ),
          ),
        ));
  }
}
