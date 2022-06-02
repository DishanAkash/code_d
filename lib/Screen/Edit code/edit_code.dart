import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

// String selectedName = '';
// String selectedID = '';

class EditCodeList extends StatefulWidget {
  const EditCodeList({Key? key}) : super(key: key);

  @override
  _EditCodeListState createState() => _EditCodeListState();
}

class _EditCodeListState extends State<EditCodeList> {
  @override
  // ignore: override_on_non_overriding_member
  TextEditingController getCname = TextEditingController();
  TextEditingController getpurchasePrice = TextEditingController();
  TextEditingController getsellingPrice = TextEditingController();

  // final _firestore = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  late String doc_id;

  Map? map;
  var docRef;
  findecode(codena) async {
    if (codena.isNotEmpty) {
      getpurchasePrice.clear();
      getsellingPrice.clear();

      FirebaseFirestore.instance
          .collection("add_code")
          .where("codename", isEqualTo: codena)
          .get()
          .then((value) {
        for (var i in value.docs) {
          map = i.data();
          docRef = i.reference;
          // doc_id = map!['doc_id'];

          getpurchasePrice.text = map!['purchaseprice'];

          getsellingPrice.text = map!['sellingprice'];

          // print(map!['balance']);

        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 0.75,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        const Text(
                          "Edit Code Details",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        //   child: Container(
                        //     height: 100,
                        //     child: Align(
                        //       alignment: Alignment.centerLeft,
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: codedropdown(_firestore),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: getCname,
                                  decoration: InputDecoration(
                                    hintText: 'Code Name',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  try {
                                    findecode(getCname.text);
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Check Code name!!!')));
                                  }
                                },
                                child: const Text(
                                  "Search",
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 2.2,
                                      color: Colors.blueAccent),
                                )),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Text(
                                          "Purchase Price : ",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          width: 220.0,
                                          height: 80.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: TextFormField(
                                              controller: getpurchasePrice,
                                              decoration: InputDecoration(
                                                labelText: 'Purchase Price',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Selling Price:      ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        width: 220.0,
                                        height: 80.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: TextFormField(
                                            controller: getsellingPrice,
                                            decoration: InputDecoration(
                                              labelText: 'Selling Price',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                      onPressed: () async {
                                        //   add_code
                                        try {
                                          docRef.update({
                                            "sellingprice":
                                                getsellingPrice.text,
                                            "purchaseprice":
                                                getpurchasePrice.text,
                                          }).whenComplete(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text('Success!')));
                                          });
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text("Check Again...")));
                                        }

                                        // getCname.clear();
                                        getpurchasePrice.clear();
                                        getsellingPrice.clear();
                                        docRef = '';
                                      },

                                      // ignore: prefer_const_constructors
                                      child: Text(
                                        "Save",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            fontSize: 16,
                                            letterSpacing: 2.2,
                                            color: Colors.blueAccent),
                                      )),
                                  const SizedBox(
                                    width: 40.0,
                                  ),
                                  OutlinedButton(
                                      onPressed: () async {
                                        try {
                                          docRef.delete().whenComplete(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Delete Success!')));
                                          });
                                          getCname.clear();
                                          getpurchasePrice.clear();
                                          getsellingPrice.clear();
                                          docRef = '';
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Check Again!!!!....")));
                                        }
                                      },

                                      // ignore: prefer_const_constructors
                                      child: Text(
                                        "Delete",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            fontSize: 16,
                                            letterSpacing: 2.2,
                                            color: Colors.blueAccent),
                                      )),
                                ]),
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

//dropdown....................
// class codedropdown extends StatefulWidget {
//   codedropdown(this.firestore);
//   FirebaseFirestore firestore;
//   @override
//   _codedropdownState createState() => _codedropdownState();
// }

// class _codedropdownState extends State<codedropdown> {
//   List<String> codenameList = [];
//   // List<String> cusIDList = [];

//   TextEditingController value = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: widget.firestore
//           .collection('add_code')
//           .orderBy('codename', descending: true)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           codenameList.clear();
//           //  cusIDList.clear();

//           final add_code = snapshot.data!.docs.reversed;
//           for (var cna in add_code) {
//             final cname = cna['codename'];

//             //  final cusID = cna.reference.id;
//             codenameList.add(cname);
//             // cusIDList.add(cusID);
//           }
//           return TextDropdownFormField(
//             options: codenameList,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               labelText: "Select Customer",
//               contentPadding: EdgeInsets.all(
//                 MediaQuery.of(context).size.height * 0.02,
//               ),
//             ),
//             onChanged: (dynamic value) {
//               // var listIndex = codenameList.indexOf(value);
//               setState(() {
//                 selectedName = value;

//                 //  selectedID = cusIDList[listIndex];
//               });
//             },
//             dropdownHeight: MediaQuery.of(context).size.height * 0.4,
//           );
//         }
//         return TextDropdownFormField(
//           options: [],
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             suffixIcon: Icon(Icons.arrow_drop_down),
//             labelText: "No customer",
//             labelStyle: TextStyle(
//               fontFamily: 'Exo2',
//             ),
//           ),
//           dropdownHeight: 120,
//         );
//       },
//     );
//   }
// }
