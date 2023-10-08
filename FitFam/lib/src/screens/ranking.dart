import 'package:flutter/material.dart';

import '../common_widgets/custom_app_bar.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  final List<String> group1 = ['Str', 'Strr'];
  final List<String> group2 = [];
  final List<String> group3 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: CustomAppBar(),
        ),
        body: ListView.builder(
          itemCount: group1.length,
          itemBuilder: (context, index) {
            final group = group1[index];
            return ListTile(
              title: Text(group),
            );
          },
        ));
  }
}
