import 'package:fitfam/src/models/event.dart';
import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class CustomListTile extends StatelessWidget {
  final Event event;

  const CustomListTile({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 500.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: GlobalVariables.grayColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(event.name),
      ),
    );
  }
}
