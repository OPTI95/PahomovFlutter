import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_model.dart';

class HomeScreen extends StatefulWidget {
  late MyModel myModel;
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
     Provider.of<MyModel>(context).loadList();
     widget.myModel.loadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add');
          },
          icon: Icon(Icons.add)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
              itemCount: widget.myModel.listBox.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(widget.myModel.list[index]),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/edit',
                              arguments: widget.myModel.list[index]);
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                         widget.myModel.removeList(widget.myModel.list[index]);
                        },
                        icon: Icon(Icons.remove)),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
