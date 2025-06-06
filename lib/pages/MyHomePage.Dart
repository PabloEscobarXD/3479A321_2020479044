import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/ListContent.dart';
import '../pages/About.dart';
import '../pages/Preferences.dart';
import '../provider/changeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isResetEnabled = true;
  String assetName = 'assets/icons/sillyicon.svg';
  String _imageUrl = 'https://picsum.photos/250?image=0';

  static const List<String> _titles = [
    'HomePage',
    'ListContent',
    'About',
  ];

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isResetEnabled = prefs.getBool('isResetEnabled') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _goToPreferences() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PreferencesPage(title: 'Preferencias'),
      ),
    ).then((_) {
      _loadPreferences();
    });
  }

  Future<void> _getNewImage() async {
      int imageURLNumber = context.read<AppData>().counter;
      final newImageUrl = 'https://picsum.photos/250?image=$imageURLNumber';
      try {
        final response = await http.head(Uri.parse(newImageUrl));
        if (response.statusCode == 200) {
          setState(() {
            _imageUrl = newImageUrl;
          });
        } else {
          setState(() {
            _imageUrl = '';
          });
        }
      } catch (e) {
        setState(() {
          _imageUrl = '';
        });
      }
    }


  @override
  Widget build(BuildContext context) {
    print('build() llamado');

    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              title: Text(_titles[_selectedIndex]),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Preferencias',
                  onPressed: _goToPreferences,
                ),
              ],
            )
          : null,
      body: _selectedIndex == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.purpleAccent,
                    elevation: 50,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          assetName,
                          semanticsLabel: 'Dart Logo',
                          width: 50,
                          height: 50,
                        ),
                        const Text('Flutter es un FRAMEWORK!'),
                        Text('${context.watch<AppData>().counter}'),
                        const SizedBox(height: 30, width: 300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: context.read<AppData>().incrementCounter,
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                            TextButton(
                              onPressed: context.read<AppData>().decrementCounter,
                              child: const Icon(Icons.remove, color: Colors.white),
                            ),
                            TextButton(
                              onPressed: _isResetEnabled
                                  ? context.read<AppData>().resetCounter
                                  : null,
                              child: const Icon(Icons.refresh, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30, width: 300),
                        TextButton(
                          onPressed: _getNewImage,
                          child: const Text('Refresh Image'),
                        ),
                        Image.network( 
                            _imageUrl.isNotEmpty ? _imageUrl : '', 
                            width: 250, 
                            height: 250, 
                            fit: BoxFit.cover, 
                            errorBuilder: (context, error, stackTrace) { 
                            return Center( 
                              child: Text( 
                              'Failed to load image', 
                              style: TextStyle(color: Colors.red), 
                              ), 
                            ); 
                          }, 
                        ) 
                      ],
                    ),
                  ),
                ],
              ),
            )
          : _selectedIndex == 1
              ? const ListContent(title: 'ListContent')
              : const About(title: 'About'),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
