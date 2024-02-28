import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  final void Function() onPressed;
  final bool isUpdatePost;

  const FormSubmitBtn({
    super.key,
    required this.onPressed,
    required this.isUpdatePost,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(MediaQuery.sizeOf(context).width, 48)),
        onPressed: onPressed,
        child: Text(isUpdatePost ? "Update" : "Add",
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }
}
