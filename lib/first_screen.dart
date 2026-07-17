import 'package:flutter/material.dart';
import 'counter_element.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _keepAlive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        backgroundColor: Colors.blue.shade100,
        actions: [
          Switch(
            value: _keepAlive,
            onChanged: (value) {
              setState(() {
                _keepAlive = value;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return CounterElement(
              key: ValueKey(index),
              index: index,
              keepAlive: _keepAlive,
            );
          },
        ),
      ),
    );
  }
}
