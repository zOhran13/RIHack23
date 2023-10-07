import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: Container(
          color: GlobalVariables.appBarColor,
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Row(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.0, left: 40.0),
                    child: Text(
                      'Hello Amina!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(
                    GlobalVariables.runManIcon,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text('Level 1'),
          ]),
        ),
      ),
      body: ListView(children: const [
        ListTile(
          title: Text('Naziv'),
        ),
        ListTile(
          title: Text('Naziv'),
        ),
        ListTile(
          title: Text('Naziv'),
        )
      ]),
    );
  }
}
