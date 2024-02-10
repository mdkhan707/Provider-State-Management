import 'dart:async';

import 'package:flutter/material.dart';

class Provider extends StatefulWidget {
  const Provider({super.key});

  @override
  State<Provider> createState() => _ProviderState();

  static of(BuildContext context) {}
}

class _ProviderState extends State<Provider> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Provider'),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
                  child: Text(
                count.toString(),
                style: TextStyle(fontSize: 50),
              )),
            )
          ]),
    );
  }
}
