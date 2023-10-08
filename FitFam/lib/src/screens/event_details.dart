import 'package:fitfam/src/common_widgets/custom_alert_dialog.dart';
import 'package:fitfam/src/models/event.dart';
import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';

import '../common_widgets/custom_text_view.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    String image = GlobalVariables.otherImage;
    switch (event.type) {
      case EventType.walk:
        image = GlobalVariables.walkImage;
        break;
      case EventType.hike:
        image = GlobalVariables.hikeImage;
        break;
      case EventType.run:
        image = GlobalVariables.runImage;
        break;
      case EventType.cycle:
        image = GlobalVariables.cycleImage;
        break;
      default:
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.textFieldColor2,
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).padding.top,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 160.0,
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: GlobalVariables.grayColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                children: [
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    top: 0.0,
                    bottom: 0.0,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    child: Container(
                      height: 40.0,
                      color: const Color.fromARGB(204, 114, 181, 220),
                      child: TextButton(
                        child: const Text(
                          'Join',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const CustomAlertDialog(
                                  text1: 'Join this event?',
                                  text2:
                                      'Would you really like to join this event?'));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomTextView(
            text: event.name,
            label: 'Name',
          ),
          CustomTextView(
            text: '${event.date.day}/${event.date.month}/${event.date.year}',
            label: 'Date',
          ),
          CustomTextView(
            text: event.type.name,
            label: 'Type',
          ),
          CustomTextView(
            text: event.location.toString(),
            label: 'Location',
          ),
          CustomTextView(
            text: event.points.toString(),
            label: 'Points',
          ),
          CustomTextView(
            text: event.capacity.toString(),
            label: 'Capacity',
          ),
          CustomTextView(
            text: event.going.toString(),
            label: 'Going',
          ),
          CustomTextView(
            text: event.description,
            label: 'Description',
          ),
        ],
      ),
    );
  }
}
