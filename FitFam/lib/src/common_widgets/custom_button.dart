import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: GlobalVariables.textFieldColor2,
          borderRadius: BorderRadius.circular(10.0)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Done',
          style: GlobalVariables.textStyle2.copyWith(
            color: GlobalVariables.grayColor,
          ),
        ),
      ),
    );
  }
}
