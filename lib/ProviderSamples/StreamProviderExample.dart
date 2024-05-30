import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Stream<int> counterStream() async* {
  int counter = 0;
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield counter++;
  }
}

class StreamProviderExample extends StatelessWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>(
      create: (_) => counterStream(),
      initialData: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('StreamProvider Example'),
        ),
        body: const Center(
          child: CounterWidget(),
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<int>(context);

    return Text(
      '每一秒添加1\nCounter: $counter',
      style: const TextStyle(fontSize: 24),
    );
  }
}
