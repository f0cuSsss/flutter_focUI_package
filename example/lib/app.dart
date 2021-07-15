import 'package:flutter/material.dart';
import 'package:foc_ui/foc_ui.dart';

import 'ui/screens/widget_list_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets',
      color: Colors.grey[100],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[100],
        ),
        textTheme: TextTheme(
          button: TextStyle(
            fontSize: 18.0,
            letterSpacing: 0.5,
            color: fGetColorFromBackground(kAccent),
          ),
        ),
      ),
      home: const WidgetListScreen(),
    );
  }
}
