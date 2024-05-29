import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ProviderTest extends StatelessWidget {
  const ProviderTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Route'),
        ),
        body: Center(
          child: ChangeNotifierProvider(
            create: (_) => CounterModel(),
            child: const MaterialApp(
              title: 'Provider Test',
              home: CounterScreen(),
            ),
          ),
        ));
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 使用 Provider.of 获取 CounterModel 实例
    final counter = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${counter.count}',
              style: const TextStyle(fontSize: 36),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 调用 CounterModel 的 increment 方法
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
