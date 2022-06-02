import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:code_d/Screen/Add%20code/appbar.dart';
import 'package:code_d/Screen/Code%20list/appbar.dart';
import 'package:code_d/Screen/Edit%20code/editcode_appbar.dart';

import 'package:code_d/Screen/setting.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final screens = [
    Bar(),
    EditBar(),
    ListBar(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.black,
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.code),
              title: const Text('Add code'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.edit),
                title: const Text('Edit Code'),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: const Icon(Icons.list_alt),
                title: const Text('Code list'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: const Icon(Icons.settings),
                title: const Text('Settings'),
                activeColor: Colors.blue),
          ],
        ));
  }
}
