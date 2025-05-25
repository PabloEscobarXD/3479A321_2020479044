import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key, required this.title});

  final String title;

  @override
  State<PreferencesPage> createState() => PreferencesPageState();
}

class PreferencesPageState extends State<PreferencesPage> {

  bool _isResetEnabled = false;
  String assetName = 'assets/icons/pirateSkull.svg';

  Future<void> _loadPreferences() async { 
  final prefs = await SharedPreferences.getInstance(); 
  setState(() { 
  _isResetEnabled = prefs.getBool('isResetEnabled') ?? false; 
  }); 
  } 

  Future<void> _savePreferences() async { 
   final prefs = await SharedPreferences.getInstance(); 
   await prefs.setBool('isResetEnabled', _isResetEnabled); 
  } 

 @override 
  void initState() { 
  super.initState(); 
  _loadPreferences(); 
  } 

  @override
  void dispose() {
    super.dispose();
    _savePreferences();
  }

  void _changePage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const SizedBox(height: 50, width: 250,
          child: Text('Pablo Escobar estuvo aquí')),
          SvgPicture.asset(
                  assetName,
                  semanticsLabel: 'PIRATAAAAA',
                  width: 70,
                  height: 70,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: _changePage,
                child: const Text("Volver"),
              )
            ],
          ),
        ],
      ),
    )
    );
  }
}
