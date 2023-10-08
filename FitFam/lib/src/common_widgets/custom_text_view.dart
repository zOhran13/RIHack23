import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final String label;
  const CustomTextView({super.key, required this.text, this.label = ''});

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
              color: GlobalVariables.textFieldColor2,
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
