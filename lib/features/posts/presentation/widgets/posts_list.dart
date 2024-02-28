import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/presentation/pages/post_details_page.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  final List<PostEntities> posts;
  const PostsList({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(posts[index].id.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          title: Text(
            posts[index].title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            posts[index].body,
            style:  TextStyle(fontSize: 16,color: Colors.grey.shade300),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PostDetailsPage(post: posts[index]),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
