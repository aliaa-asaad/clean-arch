import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/post_details.dart';
import 'package:flutter/material.dart';


class PostDetailsPage extends StatelessWidget {
  final PostEntities post;
  const PostDetailsPage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: const Text(
            "Post Details",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: _buildBody(),
    );
  }

 

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: PostDetails(post: post),
      ),
    );
  }
}
