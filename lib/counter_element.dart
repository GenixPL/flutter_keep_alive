import 'package:flutter/material.dart';

class CounterElement extends StatefulWidget {
  const CounterElement({
    super.key,
    required this.index,
    required this.keepAlive,
  });

  final int index;
  final bool keepAlive;

  @override
  State<CounterElement> createState() => _CounterElementState();
}

class _CounterElementState extends State<CounterElement>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant CounterElement oldWidget) {
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
