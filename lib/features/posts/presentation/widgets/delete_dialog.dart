import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_crud_bloc/posts_crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteDialog extends StatelessWidget {
  final int postId;
  const DeleteDialog({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you Sure ?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "No",
          ),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<PostsCrudBloc>(context).add(
              DeletePostEvent(postId: postId),
            );
          },
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
