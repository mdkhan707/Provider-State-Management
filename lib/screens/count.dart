import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 2), (timer) {
      final countProvider = Provider.of<CountProvider>(context, listen: false);
      countProvider.SetCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Provider'),
        centerTitle: true,
      ),
      body: Center(
          child: Consumer<CountProvider>(builder: (context, value, child) {
        // print('Only this widget will be print');
        return Text(
          value.count.toString(),
          style: const TextStyle(fontSize: 50),
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.SetCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
