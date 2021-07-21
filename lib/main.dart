//dart imports

//packages
import 'package:crypton_test_task/providers/news_provider.dart';
import 'package:crypton_test_task/screens/main_screen.dart';
import 'package:crypton_test_task/widgets/sign_in/gradient_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//files
import './screens/sign_up_screen.dart';
import './screens/news_screen.dart';
import './screens/main_screen.dart';
import './providers/news_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => NewsProvider(),
      child: MaterialApp(
        title: 'TestTask',
        theme: ThemeData(
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.white,
              fontSize: 20,
            ),
          )
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //return MainScreen();
    return SignUpScreen();
  }
}
