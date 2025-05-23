import 'package:flutter/material.dart';
import '../pages/About.dart';


class ListContent extends StatefulWidget {
  const ListContent({super.key, required this.title});

  final String title;

  @override
  State<ListContent> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {

  void _changePage(int value) {
    if(value == 1)
    {
      Navigator.pop(context);
    }
    else
    {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const About(title: 'About')),
    );
    }
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
          const SizedBox(height: 70, width: 400,
          child: const Text('En esta página se muestra mucho contenido, como este texto. Hola! soy el texto del contenido!\n ')),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: () => _changePage(1),
                child: const Text("Home"),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                heroTag: null,
                onPressed: () => _changePage(2),
                child: const Text("About"),
              ),
            ],
          ),
        ],
      ),
    )
    );
  }
}
