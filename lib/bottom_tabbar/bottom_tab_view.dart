import 'package:flutter/material.dart';
import 'package:sqflite_test/bottom_tabbar/home_view.dart';
import 'package:sqflite_test/bottom_tabbar/message_view.dart';
import 'package:sqflite_test/bottom_tabbar/profile_view.dart';

class BottomTabbarView extends StatefulWidget {
  @override
  _BottomTabbarViewState createState() => _BottomTabbarViewState();
}

class _BottomTabbarViewState extends State<BottomTabbarView> {
  int _currentIndex = 0;
  List<Widget> _children = [HomeView(), MessageView(), ProfileView()];

  onTapped(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Message"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          ]),
    );
  }
}
