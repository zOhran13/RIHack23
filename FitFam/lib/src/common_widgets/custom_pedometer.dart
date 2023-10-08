import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomPedometer extends StatelessWidget {
  final String? steps;
  final String? status;
  const CustomPedometer({super.key, required this.steps, this.status});

  @override
  Widget build(BuildContext context) {
    double steps1 = steps != null ? double.parse(steps!) : 0;
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
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.bothCurve,
                  color: Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: steps1,
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
                        '$steps1 / 6000',
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w500),
                      ))
                ])
          ]),
        ),
        Icon(
          status == 'walking' ? Icons.directions_walk : Icons.accessibility_new,
          size: 100,
        ),
        Center(
          child: Text(
            status != '?' ? status! : 'stopped',
            style: const TextStyle(fontSize: 30),
          ),
        )
      ],
    );
  }
}
