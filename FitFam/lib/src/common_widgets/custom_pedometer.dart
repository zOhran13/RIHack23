import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class Pedometer extends StatelessWidget {
  const Pedometer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Color.fromARGB(30, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
  RangePointer(
  value: 25,
  cornerStyle: CornerStyle.bothCurve,
  width: 0.2,
  sizeUnit: GaugeSizeUnit.factor,
   )
  ],annotations: <GaugeAnnotation>[
  GaugeAnnotation(
  positionFactor: 0.1,
  angle: 90,
  widget: Text(
  25.toStringAsFixed(0) + ' / 100',
  style: TextStyle(fontSize: 11),
  ))
  ])

                      
                      
                    ]),
      ),
    );
  }
}
  

