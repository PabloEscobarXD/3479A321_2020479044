import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../entity/Activity.dart';
import 'package:application_laboratorio/services/database_helper.dart';

class ActivitiesListPage extends StatefulWidget {
  const ActivitiesListPage({super.key, required this.title});

  final String title;

  @override
  State<ActivitiesListPage> createState() => _ActivitiesListPage();
}

class _ActivitiesListPage extends State<ActivitiesListPage> {

  String assetName = 'assets/icons/pirateSkull.svg';
  final DatabaseHelper _dbHelper = DatabaseHelper(); 
  List<Activity> _activities = [];

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
