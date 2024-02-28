import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_crud_bloc/posts_crud_bloc.dart';
import 'package:clean_arch_omran/features/posts/presentation/pages/all_posts_page.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/custom_loading.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/delete_dialog.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/snake_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeletePostBtn extends StatelessWidget {
  final int postId;
  const DeletePostBtn({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            backgroundColor: Colors.red,
            minimumSize: Size(MediaQuery.sizeOf(context).width / 2 - 32, 48)),
      onPressed: () => deleteDialog(context, postId),
      child: const Text("Delete",   style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }

  void deleteDialog(BuildContext context, int postId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<PostsCrudBloc, PostsCrudState>(
            listener: (context, state) {
              if (state is PostsCrudLoaded) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const AllPostsPage(),
                    ),
                    (route) => false);
              } else if (state is PostsCrudError) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is PostsCrudLoading) {
                return const AlertDialog(
                  title: CustomLoading(),
                );
              }
              return DeleteDialog(postId: postId);
            },
          );
        });
  }
}
