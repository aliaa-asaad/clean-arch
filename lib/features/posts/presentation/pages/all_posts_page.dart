import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:clean_arch_omran/features/posts/presentation/pages/post_crud_page.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/custom_loading.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/message_display.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPostsPage extends StatelessWidget {
  const AllPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: const Text(
            'Posts',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return const CustomLoading();
          } else if (state is PostsLoaded) {
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: PostsList(posts: state.posts));
          } else if (state is PostsError) {
            return MessageDisplay(message: state.message);
          }
          return const CustomLoading();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const PostCrudPage(
              isUpdatePost: false,
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
