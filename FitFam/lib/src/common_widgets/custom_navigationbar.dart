import 'package:fitfam/src/screens/home.dart';
import 'package:fitfam/src/screens/profile.dart';
import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatefulWidget {


  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProfileScreen(),
    Text('Ranking Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
             icon: SvgPicture.asset(GlobalVariables.homePageIcon),
            label: ('Home'),
            backgroundColor: Color(0xFF72B6DC),
          ),
          
          
           BottomNavigationBarItem(
            icon: SvgPicture.asset(GlobalVariables.userIcon),
            label: ('Profile'),
            backgroundColor:Color(0xFF72B6DC),
          ),
           BottomNavigationBarItem(
            icon: SvgPicture.asset(GlobalVariables.rankingIcon),
            label: ('Ranking'),
            backgroundColor: const Color(0xFF72B6DC),
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
