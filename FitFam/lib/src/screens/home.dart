import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common_widgets/custom_list_tile.dart';
import '../models/event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Event> _events = [
    Event(
      id: 1,
      name: 'Event 1',
      description: 'Hiking trip, very nice',
      date: DateTime.now(),
      capacity: 20,
      going: 10,
      points: 10,
      type: EventType.hike,
    ),
    Event(
      id: 2,
      name: 'Event 2',
      description: 'Hiking trip, very nice',
      date: DateTime.now(),
      capacity: 20,
      going: 10,
      points: 10,
      type: EventType.hike,
    ),
    Event(
      id: 3,
      name: 'Event 3',
      description: 'Hiking trip, very nice',
      date: DateTime.now(),
      capacity: 20,
      going: 10,
      points: 10,
      type: EventType.hike,
    ),
    Event(
      id: 4,
      name: 'Event 4',
      description: 'Hiking trip, very nice',
      date: DateTime.now(),
      capacity: 20,
      going: 10,
      points: 10,
      type: EventType.hike,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: Container(
          color: GlobalVariables.appBarColor,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0, left: 30.0),
                      child: Text(
                        'Hello Amina!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                      left: 20.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset(
                        GlobalVariables.runManIcon,
                      ),
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Level 1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                child: LinearProgressIndicator(
                  minHeight: 10.0,
                  value: 0.3,
                  semanticsLabel: 'Linear progress indicator',
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: GlobalVariables.progressColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Events',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomListTile(
                  event: _events.elementAt(index),
                );
              },
              itemCount: _events.length,
            ),
          ),
        ],
      ),
    );
  }
}
