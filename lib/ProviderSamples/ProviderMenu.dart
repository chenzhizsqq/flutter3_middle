import 'package:flutter/material.dart';
import 'ProviderTest.dart';
import 'FR_FutureProviderTest.dart';
import 'FutureTest.dart';
import 'StreamProviderExample.dart';

class ProviderMenu extends StatelessWidget {
  const ProviderMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Menu"),
      ),
      body: ListView(children: <Widget>[
        ElevatedButton(
          child: const Text("Provider 小Test"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProviderTest()));
          },
        ),
        //FR_FutureProviderTest
        ElevatedButton(
          child: const Text("flutter_riverpod 的Json例子:FutureProvider Test"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FR_FutureProviderTest()));
          },
        ),
        ElevatedButton(
          child: const Text("Provider 的Json例子:Future Test"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FutureTest()));
          },
        ),
        //StreamProviderExample
        ElevatedButton(
          child: const Text("Provider 的 实时数据更新 例子:\nStreamProvider Example"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StreamProviderExample()));
          },
        ),
      ]),
    );
  }
}
