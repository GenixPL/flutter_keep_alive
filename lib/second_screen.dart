import 'package:flutter/material.dart';
import 'counter_element.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _keepAlive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Second Screen (Slivers)'),
            backgroundColor: Colors.green.shade100,
            floating: true,
            pinned: true,
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CounterElement(
                  key: ValueKey(index),
                  index: index,
                  keepAlive: _keepAlive,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
