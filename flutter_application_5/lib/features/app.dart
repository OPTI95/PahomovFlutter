import 'package:flutter/material.dart';
import 'package:flutter_application_5/features/todo/presentation/controller/todo_controller.dart';
import 'package:flutter_application_5/features/todo/presentation/ui/home.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => TodoController(),
        child: const Home()
      ),
    );
  }
}