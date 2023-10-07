import 'package:fitfam/src/common_widgets/custom_pedometer.dart';
import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';

import '../common_widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          color: GlobalVariables.textFieldColor2,
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            const CustomButton(),
            //const Text('Level 1'),
          ]),
        ),
      ),
      body: const Pedometer(),
    );
  }
}
