import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../models/event.dart';
import 'custom_list_tile.dart';

class CustomPedometer extends StatelessWidget {
  final String? steps;
  final String? status;
  const CustomPedometer({super.key, required this.steps, this.status});

  @override
  Widget build(BuildContext context) {
    final List<Event> events = [
      Event(
        id: 1,
        name: 'Event 1',
        description: 'Hiking trip, very nice',
        date: DateTime.now(),
        capacity: 20,
        going: 10,
        points: 10,
        type: EventType.walk,
        location: 'Vienna',
      ),
      Event(
        id: 4,
        name: 'Event 4',
        description: 'Hiking trip, very nice',
        date: DateTime.now(),
        capacity: 20,
        going: 10,
        points: 10,
        type: EventType.cycle,
        location: 'Vienna',
      ),
    ];

    double steps1 = steps != '?' ? double.parse(steps!) : 0;
    if (steps != null) {
      for (int i = 0; i < 100; i++) {
        if (steps1 > 6000) {
          steps1 = steps1 - 6000;
        }
      }
    }

    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Daily steps',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 180.0,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: GlobalVariables.grayColor,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    color: GlobalVariables.appBarColor,
                    value: steps1 / 60,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Text(
                        '${steps1.toInt()} / 6000',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ))
                ])
          ]),
        ),
        Icon(
          status == 'walking' ? Icons.directions_walk : Icons.accessibility_new,
          size: 70,
        ),
        Center(
          child: Text(
            status != '?' ? status! : 'stopped',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 10.0),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'My events',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CustomListTile(
                event: events.elementAt(index),
                read: true,
              );
            },
            itemCount: events.length,
          ),
        ),
      ],
    );
  }
}
