import 'package:clean_arch_omran/core/utilities/theme.dart';
import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'package:clean_arch_omran/features/posts/presentation/bloc/posts_crud_bloc/posts_crud_bloc.dart';
import 'package:clean_arch_omran/features/posts/presentation/pages/all_posts_page.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_omran/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<PostsBloc>()..add(GetPostsEvent())),
        BlocProvider(create: (context) => di.sl<PostsCrudBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeHelper.darkTheme
        /*  ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ), */
        ,
        home: const AllPostsPage(),
      ),
    );
  }
}

