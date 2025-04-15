import 'package:flutter/material.dart';
import 'package:my_books/features/home/view/home_screen.dart';
import 'package:my_books/features/home/view_model/github_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
            
        ChangeNotifierProvider(create: (_) => GitHubViewModel()),
      
      ],
      child: const HomePage()),
    );
  }
}

