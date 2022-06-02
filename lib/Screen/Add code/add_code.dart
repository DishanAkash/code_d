import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: use_key_in_widget_constructors
class Addcode extends StatefulWidget {
  @override
  State<Addcode> createState() => _AddcodeState();
}

class _AddcodeState extends State<Addcode> {
  // ignore: non_constant_identifier_names
  TextEditingController code_name = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController purchase_price = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController selling_price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 0.75,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text(
                          "Add code",
                          style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.5, 20, 10, 0),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: code_name,
                                  decoration: InputDecoration(
                                    hintText: 'Code name',
                                    hintStyle: const TextStyle(fontSize: 20),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.5, 20, 10, 0),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: purchase_price,
                                  decoration: InputDecoration(
                                    hintText: 'Purchase price',
                                    hintStyle: const TextStyle(fontSize: 20),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.5, 20, 10, 0),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: selling_price,
                                  decoration: InputDecoration(
                                    hintText: 'Selling price',
                                    hintStyle: const TextStyle(fontSize: 20),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            OutlinedButton(
                                onPressed: () async {
                                  final codename = code_name.text;
                                  final purchaseprice = purchase_price.text;
                                  final sellingprice = selling_price.text;
                                  if (codename.isEmpty ||
                                      purchaseprice.isEmpty ||
                                      sellingprice.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Cannot Be Empty!')));
                                  } else {
                                    Map<String, dynamic> data = {
                                      "codename": code_name.text,
                                      "purchaseprice": purchase_price.text,
                                      "sellingprice": selling_price.text
                                    };
                                    FirebaseFirestore.instance
                                        .collection("add_code")
                                        .add(data);
                                    code_name.clear();
                                    purchase_price.clear();
                                    selling_price.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Code Added')));
                                  }
                                },
                                child: const Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 2.2,
                                      color: Colors.blueAccent),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
