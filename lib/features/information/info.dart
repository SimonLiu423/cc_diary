import 'package:cc_diary/features/new_diary/diary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Row(children: [
        Box(),
        Box(),
      ]),
    ));
  }
}

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 500,
      child: Column(
        children: [
          Image.network(
            'https://picsum.photos/id/1003/200/300',
            fit: BoxFit.cover,
            width: 200,
            height: 300,
          ),
          const Text('Box2'),
          Counter(),
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_counter.toString()),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DiaryPage(),
                ),
              );
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30),
            )),
      ],
    );
  }
}
