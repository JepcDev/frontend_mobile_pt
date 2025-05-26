import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/post_provider.dart';
import 'screens/post_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostProvider()..fetchPosts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Posts App',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
        home: PostListScreen(),
      ),
    );
  }
}
