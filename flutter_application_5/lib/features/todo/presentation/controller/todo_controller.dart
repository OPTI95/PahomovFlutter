import 'package:flutter/material.dart';
import 'package:flutter_application_5/features/todo/domain/entity/todo_entity.dart';

enum TodoState { initial, loading, success, error }

class TodoController with ChangeNotifier {
  List<TodoEntity> get _list => [];
  int _count = 0;
  int get count => _count;
  TodoState _state = TodoState.initial;
  TodoState get state => _state;
  void init() async {
    _state = TodoState.loading;
    await Future.delayed(Duration(seconds: 2));
    _list.add(TodoEntity(name: 'name', description: 'desc'));
    _count = _list.where((element) => !element.isCheck).length;
    _state = TodoState.success;
    notifyListeners();
  }
}
