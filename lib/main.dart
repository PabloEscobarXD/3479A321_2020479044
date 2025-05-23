import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'pages/MyHomePage.dart';
import 'provider/changeNotifier.dart';

var logger = Logger();

void main() {
  logger.d("Logger is working!");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>( 
          create: (context) => AppData(), 
          child: MaterialApp( 
          title: 'My App', 
          theme: ThemeData( 
          primarySwatch: Colors.blue, 
         ), 
        home: MyHomePage(title: 'Flutter Demo Home Page'), 
      ), 
    ); 
  }
}
