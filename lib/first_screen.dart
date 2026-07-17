import 'package:flutter/material.dart';

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
            return _Element(
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

class _Element extends StatefulWidget {
  const _Element({
    super.key,
    required this.index,
    required this.keepAlive,
  });

  final int index;
  final bool keepAlive;

  @override
  State<_Element> createState() => _ElementState();
}

class _ElementState extends State<_Element> with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant _Element oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
  }

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
    super.build(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
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
              Spacer(),
              IconButton(
                onPressed: () {
                  _counter++;
                  setState(() {});
                },
                icon: Icon(Icons.plus_one),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
