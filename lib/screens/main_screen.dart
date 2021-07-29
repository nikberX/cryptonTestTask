import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './news_screen.dart';
import './dietary_screen.dart';
import './map_screen.dart';
import './chat_screen.dart';
import './training_screen.dart';



class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final List<Widget> _pages = [
    NewsScreen(),
    DietaryScreen(),
    ChatScreen(),
    TrainingScreen(),
    MapScreen()
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (key) => _selectPage(key),
        backgroundColor: Colors.white,
        elevation: 5,
        unselectedFontSize: 0,
        unselectedItemColor: Color(0xFFCED0D5),
        fixedColor: Color(0xFFD1414F),
        selectedLabelStyle: TextStyle(
          fontSize: 10,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedPageIndex,
        items: [
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/navbaricons/news.png')), //Color(0xFFCED0D5)
            label: 'News',
            backgroundColor: Colors.white
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/navbaricons/dietary.png')),
            label: 'Dietary',
            backgroundColor: Colors.white
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/navbaricons/chat.png')),
            label: 'Chat',
            backgroundColor: Colors.white
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/navbaricons/training.png')),
            label: 'Training',
            backgroundColor: Colors.white
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/navbaricons/map.png')),
            label: 'Map',
            backgroundColor: Colors.white
          ),
        ],
      ),
    );
  }
}