import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
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
// This is the theme of your application.
//
// TRY THIS: Try running your application with "flutter run". You'll see
// the application has a blue toolbar. Then, without quitting the app,
// try changing the seedColor in the colorScheme below to Colors.green
// and then invoke "hot reload" (save your changes or press the "hot
// reload" button in a Flutter-supported IDE, or press "r" if you used
// the command line to start the app).
//
// Notice that the counter didn't reset back to zero; the application
// state is not lost during the reload. To reset the state, use hot
// restart instead.
//
// This works for code too, not just values: Most code changes can be
// tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final TextEditingController contoller = TextEditingController();
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = "";
  String _localOutput = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              controller: widget.contoller,

            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    int? res = int.tryParse(widget.contoller.text);
                    if (!RegExp(r'[a-zA-Z]').hasMatch(widget.contoller.text)) {
                      Parser p = Parser();
                      Expression exp = p.parse(widget.contoller.text);
                      ContextModel cm = ContextModel();
                      double result = exp.evaluate(EvaluationType.REAL, cm);
                      _output = result.toString();
                      _localOutput = result.round().toString();
                    }
                  });
                },
                child: Text("Найти решение")),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(_output),
            ),
            ElevatedButton(
                child: Text("10"),
                onPressed: () {
                  return _onButtonPressed(10);
                }),
            ElevatedButton(
                child: Text("2"),
                onPressed: () {
                  return _onButtonPressed(2);
                }),
            ElevatedButton(
                child: Text("8"),
                onPressed: () {
                  return _onButtonPressed(8);
                }),
            ElevatedButton(
                child: Text("16"),
                onPressed: () {
                  return _onButtonPressed(16);
                }),
          ],
        ),
      ),
    );
  }

  String convertToBase(String input, int system) {
    int? number = int.tryParse(input);
    if (number == null) {
      return "Ошибка";
    }
    switch (system) {
      case 10:
        return number.toString();
      case 2:
        return number.toRadixString(2);
      case 8:
        return number.toRadixString(8);
      case 16:
        return number.toRadixString(16);
      default:
        return "Неизвестная система";
    }
  }

  void _onButtonPressed(int num) async {
    setState(() {
      _output = convertToBase(_localOutput, num);
    });
  }
}
