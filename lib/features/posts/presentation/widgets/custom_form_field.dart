import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool multiLines;
  final String name;
  const CustomFormField({
    super.key,
    required this.controller,
    required this.multiLines,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, ),
        child: TextFormField(
          minLines: multiLines ? 6 : 1,
          maxLines: multiLines ? 6 : 1,
          controller: controller,
          validator: (val) => val!.isEmpty ? "$name Can't be empty" : null,
          decoration: InputDecoration(hintText: name),
        ));
  }
}
