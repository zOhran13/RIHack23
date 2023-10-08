import 'package:fitfam/src/screens/event_details.dart';
import 'package:fitfam/src/screens/home.dart';
import 'package:fitfam/src/screens/profile.dart';
import 'package:fitfam/src/screens/reward.dart';
import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/event.dart';

class CustomNavigationBar extends StatefulWidget {
  final Event? event;
  const CustomNavigationBar({super.key, this.event});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  Event? event;
  int _selectedIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
     const ProfileScreen(),
    Text('Ranking Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    PhotoListWidget(
  photos: [
    PhotoItem(
      imageUrl: 'https://images.thdstatic.com/productImages/3f2eedea-5c57-4405-8f6f-533e01d50b68/svn/isotunes-ear-plugs-it-22-64_1000.jpg',
      name: 'Reward 1.',
      description: 'Description of Reward 1',
    ),
    PhotoItem(
      imageUrl: 'https://www.sportvision.hr/files/images/2022/5/3/sport_vision_blog_patike_maraton_photo_6.jpg',
      name: 'Reward 2.',
      description: 'Description of Reward 2',
    ),
    // Add more PhotoItem objects as needed.
  ],
)
  ];

  @override
  void initState() {
    event = widget.event;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      event = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: event != null
            ? EventDetailsScreen(
                event: widget.event!,
              )
            : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(GlobalVariables.homePageIcon),
            label: ('Home'),
            backgroundColor: const Color(0xFF72B6DC),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(GlobalVariables.userIcon),
            label: ('Profile'),
            backgroundColor: const Color(0xFF72B6DC),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(GlobalVariables.rankingIcon),
            label: ('Ranking'),
            backgroundColor: const Color(0xFF72B6DC),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              GlobalVariables.rewardIcon,
              width: 32.0,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            label: ('Reward'),
            backgroundColor: const Color(0xFF72B6DC),
          )
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}