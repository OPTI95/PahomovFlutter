import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_model.dart';

class AddItemScreen extends StatefulWidget {
  AddItemScreen({super.key});
  TextEditingController controller = TextEditingController();
  bool error = false;

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextField(
              decoration: InputDecoration(errorText: widget.error ? "Пусто" : null),
              controller: widget.controller,
            ),
            ElevatedButton(
                onPressed: () {
                    String text =  widget.controller.text.trim();
                  if (text.length > 0) {
                    myModel.addList(text);
                    Navigator.of(context).pushNamed('/');
                  } else {  
                    widget.error = true;
                  }
                  setState(() {});
                },
                child: Text("Добавить")),
          ],
        ),
      ),
    );
  }
}
