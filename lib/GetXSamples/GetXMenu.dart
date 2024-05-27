import 'package:flutter/material.dart';
import 'GetXEasy.dart';
import 'GetXGetPage.dart';
import 'package:get/get.dart';

class GetXMenu extends StatelessWidget {
  const GetXMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Menu"),
      ),
      body: ListView(children: <Widget>[
        ElevatedButton(
          child: const Text("GetX Easy"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GetXEasy()));
          },
        ),
        ElevatedButton(
          child: const Text("GetX GetPage"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GetXGetPage()));
          },
        ),
      ]),
    );
  }
}
