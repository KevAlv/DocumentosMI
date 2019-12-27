import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ml_kit/pages/photo_picker_page.dart';
import 'package:ml_kit/pages/search_page.dart';
import 'documentos_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  //Manejaremos los tabs
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    SearchPage(),
    // ListaUsuarios(),
    PhotoPicker(),
     DocumentosView(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        backgroundColor: Colors.white,
        
        onTap: onTabTapped, // new
        items: [
          Icon(Icons.search, size: 20),
          Icon(Icons.add, size: 20),
          Icon(Icons.list, size: 20),
        ],
      ),
    );
  }
}
