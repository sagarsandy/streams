import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counterValue = 0;
  final StreamController streamController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  counterValue.toString(),
                  style: const TextStyle(fontSize: 25),
                );
              }
              return const Text(
                "Boooom",
                style: TextStyle(fontSize: 30, color: Colors.red),
              );
            }),
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                streamController.sink.add(counterValue--);
              },
              child: const Icon(
                Icons.keyboard_arrow_down,
                size: 25,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                counterValue = 0;
                streamController.sink.add(counterValue);
              },
              child: const Icon(
                Icons.refresh,
                size: 25,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                streamController.sink.add(counterValue++);
              },
              child: const Icon(
                Icons.keyboard_arrow_up,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}