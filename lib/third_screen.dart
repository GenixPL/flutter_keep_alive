import 'package:flutter/material.dart';
import 'counter_element.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _keepAlive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        backgroundColor: Colors.orange.shade100,
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
        child: ListView.separated(
          itemCount: 100,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
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
