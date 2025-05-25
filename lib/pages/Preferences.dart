import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key, required this.title});

  final String title;

  @override
  State<PreferencesPage> createState() => PreferencesPageState();
}

class PreferencesPageState extends State<PreferencesPage> {

  bool _isResetEnabled = true;
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
          child: Text('Esta es la pantalla de preferencias')),
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
          SwitchListTile(
          title: const Text('Habilitar botón de reinicio'),
          value: _isResetEnabled,
          onChanged: (bool value) {
            setState(() {
              _isResetEnabled = value;
            });
            _savePreferences();
          },
        ),
        ],
      ),
    )
    );
  }
}
