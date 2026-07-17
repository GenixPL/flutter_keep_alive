import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _Element(index: index);
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
  });

  final int index;

  @override
  State<_Element> createState() => _ElementState();
}

class _ElementState extends State<_Element> {
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
