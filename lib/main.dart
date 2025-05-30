import 'package:application_laboratorio/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'pages/MyHomePage.dart';
import 'provider/changeNotifier.dart';

var logger = Logger();

void main() async{
  logger.d("Logger is working!");
  WidgetsFlutterBinding.ensureInitialized(); 
  await DatabaseHelper().initializeDatabase(); 
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
        home: MyHomePage(title: 'HomePage'), 
      ), 
    ); 
  }
}
