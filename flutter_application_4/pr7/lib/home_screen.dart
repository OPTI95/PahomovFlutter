import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;
  List<Widget> pages = [const OnePage(), const SecondPage(), const ThirdPage()];
  ValueNotifier<int> value = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
          actions: [
            ElevatedButton(
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('снэкбар'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Снэкбар'),
            ),
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
               return <PopupMenuEntry<String>>[
                PopupMenuItem(child: Text('Первый'), value: 'Первый'),
                PopupMenuItem(child: Text('Второй'), value: 'Второй'),
              ];
              },
            ),
            ElevatedButton(
                onPressed: () {
                  showAlertDialog(BuildContext context) {
                    Widget okButton = TextButton(
                      child: const Text("OK"),
                      onPressed: () {},
                    );
                    AlertDialog alert = AlertDialog(
                      title: const Text("My title"),
                      content: const Text("This is my message."),
                      actions: [
                        okButton,
                      ],
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                },
                child: const Text("AlertDialog"))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text('Драйвер'),
              ),
              ListTile(
                title: const Text('Первое'),
                onTap: () {
                  setState(() {
                    count = 0;
                  });
                },
              ),
              ListTile(
                title: const Text('Второе'),
                onTap: () {
                  setState(() {
                    count = 1;
                  });
                },
              ),
              ListTile(
                title: const Text('Третье'),
                onTap: () {
                  setState(() {
                    count = 2;
                  });
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (val) {
              setState(() {
                count = val;
              });
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.abc), label: "ABC"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.group_work), label: "Group")
            ]),
        body: pages[count]);
  }
}

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("First Page"),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Second Page"),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Third Page"),
    );
  }
}

class TestWidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TestWidgetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
