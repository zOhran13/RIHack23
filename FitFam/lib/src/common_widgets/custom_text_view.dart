import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final String label;
  final bool even;
  const CustomTextView(
      {super.key, required this.text, this.label = '', this.even = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              bottom: 5.0,
            ),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: even
                  ? GlobalVariables.textFieldColor2
                  : Color.fromARGB(255, 47, 158, 222),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
