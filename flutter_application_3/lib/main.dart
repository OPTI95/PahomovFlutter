import 'package:flutter/material.dart';
import 'package:flutter_application_3/screen/add_item_screen.dart';
import 'package:flutter_application_3/screen/edit_item_screen.dart';
import 'package:flutter_application_3/screen/home_screen.dart';
import 'package:flutter_application_3/screen/list_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'screen/not_found_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  runApp(ChangeNotifierProvider(
    create: ((context) => MyModel()),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => HomeScreen());
            case '/add':
              return MaterialPageRoute(builder: (context) => AddItemScreen());
            case '/edit':
              return MaterialPageRoute(
                builder: (context) => EditItemScreen(
                  text: args,
                ),
              );
            default:
              return MaterialPageRoute(builder: (context) => NotFoundScreen());
          }
        },
        home: HomeScreen());
  }
}
