import 'package:fitfam/src/common_widgets/custom_pedometer.dart';
import 'package:fitfam/src/screens/login.dart';
import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';

import '../common_widgets/custom_alert_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
    });
  }

  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onStepCountError(error) {
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: CustomPedometer(
        steps: _steps,
        status: _status,
      ),
    );
  }
}
