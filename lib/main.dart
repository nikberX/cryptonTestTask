//dart imports

//packages
import 'package:crypton_test_task/providers/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//files
import './screens/sign_up_screen.dart';
import './providers/news_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => StoreProvider(),
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
        home: SignUpScreen(),
      ),
    );
  }
}


//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