import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/presentation/pages/post_crud_page.dart';
import 'package:flutter/material.dart';

class UpdatePostBtn extends StatelessWidget {
  final PostEntities post;
  const UpdatePostBtn({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(MediaQuery.sizeOf(context).width / 2 - 32, 48)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PostCrudPage(
                isUpdatePost: true,
                post: post,
              ),
            ),
          );
        },
        child: const Text(
          "Edit",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
