import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class CustomAlertDialog extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomAlertDialog(
      {super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text1,
        style: GlobalVariables.textStyle1,
      ),
      content: Text(
        text2,
        style: GlobalVariables.textStyle2.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text(
            'Cancel',
            style: GlobalVariables.textStyle2,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text(
            'Ok',
            style: GlobalVariables.textStyle2
                .copyWith(color: GlobalVariables.textFieldColor2),
          ),
        ),
      ],
    );
  }
}
