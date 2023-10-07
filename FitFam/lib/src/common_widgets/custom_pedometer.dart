import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomPedometer extends StatelessWidget {
  final String? steps;
  final String? status;
  const CustomPedometer({super.key, required this.steps, this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SfRadialGauge(axes: <RadialAxis>[
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
                    value: steps != '?' ? double.parse(steps!) / 6000 : 0,
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
                        steps != '?' ? '$steps / 6000' : '0 / 6000',
                        style: const TextStyle(fontSize: 11),
                      ))
                ])
          ]),
          Icon(
            status == 'walking'
                ? Icons.directions_walk
                : Icons.accessibility_new,
            size: 100,
          ),
          Center(
            child: Text(
              status != '?' ? status! : 'stopped',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
