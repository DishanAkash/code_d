// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewList extends StatefulWidget {
  const ViewList({Key? key}) : super(key: key);

  @override
  _ViewListState createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
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
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "Current Code List",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("add_code")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        'No Data',
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      CircularProgressIndicator(
                                        backgroundColor: Colors.lightBlueAccent,
                                      ),
                                    ],
                                  ),
                                );
                              }
                              final payData = snapshot.data!.docs;
                              List<Widget> paymentList = [];
                              for (var payDoc in payData) {
                                final code_name = payDoc['codename'];

                                final purchase_price = payDoc['purchaseprice'];

                                final selling_price = payDoc['sellingprice'];

                                final paymentID = payDoc.reference.id;

                                paymentList.add(listPay(code_name,
                                    purchase_price, selling_price, paymentID));
                              }
                              return Expanded(
                                // ignore: avoid_unnecessary_containers
                                child: Container(
                                  child: ListView.builder(
                                      itemCount: paymentList.length,
                                      itemBuilder: (context, index) {
                                        return Align(
                                          alignment: Alignment.topCenter,
                                          child: paymentList[index],
                                        );
                                      }),
                                ),
                              );
                            })
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

Widget listPay(code_name, purchase_price, selling_price, paymentID) {
  return ListTile(
    title: Text(code_name),
    trailing: Text('Rs.' + selling_price),
    subtitle: Text('Rs. ' + purchase_price),
  );
}
