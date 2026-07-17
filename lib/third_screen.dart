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
        child: ListView.builder(
          itemCount: 100,
          // STEP
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          addSemanticIndexes: false,
          //
          itemBuilder: (BuildContext context, int index) {
            // STEP
            return KeepAlive(
              keepAlive: _keepAlive,
              child: _CounterElement(
                key: ValueKey(index),
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CounterElement extends StatefulWidget {
  const _CounterElement({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<_CounterElement> createState() => _CounterElementState();
}

class _CounterElementState extends State<_CounterElement> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('init ${widget.index}');
  }

  @override
  void dispose() {
    print('dispose ${widget.index}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          child: Row(
            children: [
              Text(
                '${widget.index}: $_counter',
              ),
              const Spacer(),
              IconButton(
                onPressed: _incrementCounter,
                icon: const Icon(Icons.plus_one),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
