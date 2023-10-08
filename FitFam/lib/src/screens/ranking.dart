import 'package:flutter/material.dart';

import '../common_widgets/custom_app_bar.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  final List<String> group1 = ['Ana', 'Amina', 'Ema', 'Maja', 'Zlata'];
  final List<String> group2 = ['Matej', 'Ena', 'Zdravko', 'Hasan', 'Toni'];
  final List<String> group3 = ['Ranka', 'Branko', 'Mujo', 'Merima', 'Marija'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: CustomAppBar(),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Age: 18 - 35',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: group1.length,
                  itemBuilder: (context, index) {
                    final group = group1[index];
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 168, 230, 251),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: ListTile(
                        leading: Text(
                          (index + 1).toString(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        title: Text(group),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Age: 36 - 59',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: group2.length,
                  itemBuilder: (context, index) {
                    final group = group2[index];
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 168, 230, 251),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: ListTile(
                        leading: Text(
                          (index + 1).toString(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        title: Text(group),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Age: 60+',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: group3.length,
                  itemBuilder: (context, index) {
                    final group = group3[index];
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 168, 230, 251),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: ListTile(
                        leading: Text(
                          (index + 1).toString(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        title: Text(group),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
