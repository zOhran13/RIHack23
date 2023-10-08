import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/login.dart';
import '../utils/global_variables.dart';
import 'custom_alert_dialog.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: GlobalVariables.textFieldColor2,
      toolbarHeight: 70.0,
      centerTitle: true,
      title: const Text(
        'FitFam',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22.0),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 10.0),
          child: InkWell(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => const CustomAlertDialog(
                  text1: 'Logout',
                  text2: 'Are you sure you want to log out?',
                ),
              ).then((value) {
                if (value == 'OK') {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                  );
                }
              });
            },
            child: SvgPicture.asset(GlobalVariables.logoutIcon,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          ),
        ),
      ],
    );
  }
}
