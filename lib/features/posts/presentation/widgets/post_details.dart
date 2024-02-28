import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/delete_post_btn.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/update_post_btn.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final PostEntities post;
  const PostDetails({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          post.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          height: 50,
        ),
        Text(
          post.body,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const Divider(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UpdatePostBtn(post: post),
            DeletePostBtn(postId: post.id)
          ],
        )
      ],
    );
  }
}
