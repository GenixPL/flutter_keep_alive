import 'package:flutter/material.dart';

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
                return _Element(
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
    print('init second screen element ${widget.index}');
  }

  @override
  void dispose() {
    print('dispose second screen element ${widget.index}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
                onPressed: () {
                  _counter++;
                  setState(() {});
                },
                icon: const Icon(Icons.plus_one),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
