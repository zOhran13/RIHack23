import 'package:fitfam/src/common_widgets/custom_button.dart';
import 'package:fitfam/src/common_widgets/custom_text_field.dart';
import 'package:fitfam/src/utils/global_variables.dart';
import 'package:flutter/material.dart';

import '../common_widgets/custom_app_bar.dart';

class NewEventScreen extends StatelessWidget {
  const NewEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0), child: CustomAppBar()),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: [
            CustomTextField(label: 'Name', controller: TextEditingController()),
            CustomTextField(
              label: 'Date',
              controller: TextEditingController(),
              textFieldType: TextFieldType.date,
            ),
            CustomTextField(label: 'Type', controller: TextEditingController()),
            CustomTextField(
                label: 'Location', controller: TextEditingController()),
            CustomTextField(
                label: 'Points', controller: TextEditingController()),
            CustomTextField(
                label: 'Capacity', controller: TextEditingController()),
            CustomTextField(
                label: 'Going', controller: TextEditingController()),
            CustomTextField(
                label: 'Description', controller: TextEditingController()),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
