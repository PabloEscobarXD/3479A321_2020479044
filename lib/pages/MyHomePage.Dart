import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/ListContent.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

    @override
    State<MyHomePage> createState() {
      print('createState');
      return _MyHomePageState();
    }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String assetName = 'assets/icons/sillyicon.svg';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
  void _changePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListContent(title: 'ListContent')),
    );
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
                Text('$_counter'),
                const SizedBox(height:30, width: 300),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: _decrementCounter,
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: _resetCounter,
                      child: const Icon(Icons.refresh, color: Colors.white),
                    ),
                  ]
                ),
                const SizedBox(height:30, width: 300)
              ],
            ),
          ),
          FloatingActionButton(
          onPressed: _changePage,
          tooltip: 'Ir a página',
          child: Icon(Icons.arrow_right_alt_outlined),
          )
        ],
      ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
