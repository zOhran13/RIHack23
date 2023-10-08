import 'package:fitfam/src/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../common_widgets/custom_app_bar.dart';

class NewEventScreen extends StatelessWidget {
  const NewEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0), child: CustomAppBar()),
      body: ListView(
        children: [
          CustomTextField(label: 'Name', controller: TextEditingController())
        ],
      ),
    );
  }
}
