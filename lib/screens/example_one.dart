import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Example One"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, valuing, child) {
            return Slider(
                min: 0,
                max: 1,
                value: valuing.value,
                onChanged: (val) {
                  valuing.Setvalue(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, valuing, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(valuing.value)),
                    child: const Center(
                      child: Text('Conatiner 1'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(valuing.value)),
                    child: const Center(
                      child: Text('Conatiner 2'),
                    ),
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
