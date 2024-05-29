import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProviderTest.dart';

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
      ]),
    );
  }
}
