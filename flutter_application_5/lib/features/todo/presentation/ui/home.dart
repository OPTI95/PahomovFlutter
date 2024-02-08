import 'package:flutter/material.dart';
import 'package:flutter_application_5/features/todo/presentation/controller/todo_controller.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: switch (
            context.select<TodoController, TodoState>((value) => value.state)) {
          TodoState.initial || TodoState.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          TodoState.success => ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: ExpansionTile(
                  title: Text("Название"),
                ),
              );
            }),
            TodoState.error => null
        });
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Не выполненные"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
