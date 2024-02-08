import 'package:flutter/material.dart';
import 'package:flutter_application_3/screen/list_model.dart';
import 'package:provider/provider.dart';

class EditItemScreen extends StatefulWidget {
  final text;
  final TextEditingController textEditingController = TextEditingController();
  bool error = false;

  EditItemScreen({super.key, required this.text});

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  @override
  void initState() {
    widget.textEditingController.text = widget.text;
    super.initState();
  }

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
              decoration:
                  InputDecoration(errorText: widget.error ? "Пусто" : null),
              controller: widget.textEditingController,
            ),
            ElevatedButton(
                onPressed: () {
                                      String text =  widget.textEditingController.text.trim();

                  if (text.length > 0) {
                    myModel.editList(
                        widget.text, text);
                          Navigator.of(context).pushNamed(
                    '/',
                  );
                  } else {
                    widget.error = true;
                  }
                  setState(() {});

                
                },
                child: Text("Изменить")),
          ],
        ),
      ),
    );
  }
}
