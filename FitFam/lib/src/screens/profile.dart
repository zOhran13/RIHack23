import 'package:fitfam/src/common_widgets/custom_pedometer.dart';
import 'package:fitfam/src/screens/login.dart';
import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common_widgets/custom_alert_dialog.dart';

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
            Container(
                padding: const EdgeInsets.only(top: 30.0),
                margin: const EdgeInsets.only(left: 300.0),
                child: InkWell(
                  onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                const CustomAlertDialog(
                              text1: 'Logout',
                              text2: 'Are you sure you want to Logout?',
                            ),
                          ).then((value) {
                    if (value == 'OK') {
                    
                      

                      
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                      );
                    }
                  });
                },

                  child: SvgPicture.asset(GlobalVariables.logoutIcon,
                  
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                ))
            //const Text('Level 1'),
          ]),
        ),
      ),
      body: const Pedometer(),
    );
  }
}
