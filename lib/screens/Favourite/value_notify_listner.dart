import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});
  // Here we have teach that how we use stateless widget as a provider

  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('HI'),
        centerTitle: true,
      ),
      body: Center(
          child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(_counter.value.toString());
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
