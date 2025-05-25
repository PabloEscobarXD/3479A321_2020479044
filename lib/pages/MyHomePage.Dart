import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/ListContent.dart';
import '../pages/About.dart';
import '../provider/changeNotifier.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String assetName = 'assets/icons/sillyicon.svg';

  static const List<String> _titles = [
    'HomePage',
    'ListContent',
    'About',
  ];

  @override
  void initState() {
    super.initState();
    print('initState() llamado - mounted: $mounted');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies() llamado');
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget() llamado');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate() llamado');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose() llamado');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble() llamado - mounted: $mounted');
  }

  void _changePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListContent(title: 'ListContent')),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() llamado');

    final List<Widget> _widgetOptions = <Widget>[
      // Index 0: HomePage Content
      Center(
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
                        onPressed: context.read<AppData>().resetCounter,
                        child: const Icon(Icons.refresh, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30, width: 300),
                ],
              ),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: _changePage,
              tooltip: 'Ir a página',
              child: const Icon(Icons.arrow_right_alt_outlined),
            )
          ],
        ),
      ),

      // Index 1: Business (ListContent)
      const ListContent(title: 'ListContent'),

      // Index 2: School (About)
      const About(title: 'About'),
    ];
    
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
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
