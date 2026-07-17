import 'package:flutter/material.dart';
import 'counter_element.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  bool _keepAlive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Screen'),
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
            return _CounterElement(
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

class _CounterElement extends StatefulWidget {
  const _CounterElement({
    super.key,
    required this.index,
    required this.keepAlive,
  });

  final bool keepAlive;
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
    // STEP KeepAlive have to be directly below the list
    return KeepAlive(
      keepAlive: widget.keepAlive && _counter > 0,
      child: Column(
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
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
