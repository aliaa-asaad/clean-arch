import 'package:clean_arch_omran/features/posts/domain/entities/post_entities.dart';
import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_crud_bloc/posts_crud_bloc.dart';
import 'package:clean_arch_omran/features/posts/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_submit_btn.dart';

class CustomForm extends StatefulWidget {
  final bool isUpdatePost;
  final PostEntities? post;
  const CustomForm({
    super.key,
    required this.isUpdatePost,
    this.post,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePost) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFormField(
                name: "Title", multiLines: false, controller: _titleController),
            CustomFormField(
                name: "Body", multiLines: true, controller: _bodyController),
            const SizedBox(
              height: 16,
            ),
            FormSubmitBtn(
                isUpdatePost: widget.isUpdatePost,
                onPressed: validateFormThenUpdateOrAddPost),
          ]),
    );
  }

  void validateFormThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final post = PostEntities(
          id: widget.isUpdatePost ? widget.post!.id : -1,
          title: _titleController.text,
          body: _bodyController.text);

      if (widget.isUpdatePost) {
        BlocProvider.of<PostsCrudBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<PostsCrudBloc>(context).add(AddPostEvent(post: post));
      }
    }
  }
}
