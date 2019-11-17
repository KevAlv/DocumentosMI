import 'package:flutter/material.dart';
import 'package:ml_kit/pages/photo_picker_page.dart';
import 'package:ml_kit/pages/search_view.dart';
import 'documentos_page.dart';
import 'example_page.dart';

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
  DocumentosView(),
   PhotoPicker(),
   SearchPage()];
 @override
 Widget build(BuildContext context) {
   return Scaffold(

    body: _children[_currentIndex],

     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // 
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.inbox),
           title: new Text('Expedientes'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.image),
           title: new Text('Camara'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.search),
           title: Text('Busqueda')
         ),
         
       ],
     ),
   );
 }
}