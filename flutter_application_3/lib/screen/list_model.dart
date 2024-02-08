import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyModel extends ChangeNotifier {
  late Box<String> listBox; 

  final String _listKey = 'list';

  List<String> list = [];

  MyModel() {
    loadList();
  }


  Future<void> loadList() async {
    listBox = await Hive.openBox<String>(_listKey);

    notifyListeners();
  }

  Future<void> _saveList() async {
    await listBox?.clear();
    await listBox?.addAll(list);
  }

  void addList(String item) {
    list.add(item); 
    _saveList();
    notifyListeners();
  }

  void editList(String item, String newItem) {
    int index = list.indexOf(item);
    if (index != -1) {
      list[index] = newItem;
      _saveList();
      notifyListeners();
    }
  }

  void removeList(String item) {
    list.remove(item); 
    _saveList();
    notifyListeners();
  }
}
