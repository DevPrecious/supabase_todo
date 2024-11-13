import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp/pages/todo_page.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://fgwimcmjotakgemelupl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZnd2ltY21qb3Rha2dlbWVsdXBsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1MDgxMDYsImV4cCI6MjA0NzA4NDEwNn0.5Kb3vJfm9d7c9l9X_Yq2YN5QIfRAkXbGsU29JnU0Se0',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}