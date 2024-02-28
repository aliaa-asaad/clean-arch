import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_crud_bloc/posts_crud_bloc.dart';
import 'package:clean_arch_omran/features/posts/presentation/pages/all_posts_page.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/custom_form.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/custom_loading.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/snake_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCrudPage extends StatelessWidget {
  final PostEntities? post;
  final bool isUpdatePost;
  const PostCrudPage({super.key, this.post, required this.isUpdatePost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            isUpdatePost ? "Edit Post" : "Add Post",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: _buildBody(),
    );
  }

  

  Widget _buildBody() {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocConsumer<PostsCrudBloc, PostsCrudState>(
            listener: (context, state) {
              if (state is PostsCrudLoaded) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const AllPostsPage()),
                    (route) => false);
              } else if (state is PostsCrudError) {
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is PostsCrudLoading) {
                return const CustomLoading();
              }

              return CustomForm(
                  isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
            },
          )),
    );
  }
}
