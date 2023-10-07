import 'package:fitfam/src/models/event.dart';
import 'package:fitfam/src/screens/event_details.dart';
import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class CustomListTile extends StatelessWidget {
  final Event event;

  const CustomListTile({super.key, required this.event});

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

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EventDetailsScreen(),
        ));
      },
      child: Container(
        height: 100.0,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
                left: 10.0,
                top: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(180, 158, 158, 158),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    event.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                top: 35.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(180, 158, 158, 158),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Type: ${event.type.name}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0),
                  ),
                ),
              ),
              Positioned(
                right: 10.0,
                bottom: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(180, 158, 158, 158),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '${event.points} points',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
