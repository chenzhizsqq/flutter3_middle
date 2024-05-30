import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 定义一个 StreamProvider 来提供一个整数流
final counterStreamProvider = StreamProvider<int>((ref) async* {
  int counter = 0;
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield counter++;
  }
});

class FR_StreamProviderExample extends ConsumerWidget {
  const FR_StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听 counterStreamProvider
    final asyncValue = ref.watch(counterStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_riverpod StreamProvider Example'),
      ),
      body: Center(
        child: asyncValue.when(
          data: (count) => Text(
            'Counter: $count',
            style: const TextStyle(fontSize: 24),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}
