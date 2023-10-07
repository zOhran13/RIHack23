import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 100.0,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Logout',
          style: GlobalVariables.textStyle2.copyWith(
            color: GlobalVariables.appBarColor,
          ),
        ),
      ),
    );
  }
}
