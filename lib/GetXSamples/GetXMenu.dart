import 'package:flutter/material.dart';
import 'GetXEasy.dart';
import 'GetXGetPage.dart';
import 'GetXDialog.dart';
import 'GetXHttpPost.dart';
import 'GetXValidation.dart';
import 'GetXThemes.dart';
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
        ElevatedButton(
          child: const Text("GetX Repository and Dialog"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetXDialogLoginApp()));
          },
        ),
        //GetXHttpPost
        ElevatedButton(
          child: const Text("GetX Http Post"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetXHttpPost()));
          },
        ),
        //GetXValidation
        ElevatedButton(
          child: const Text("GetX Validation 验证"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetXValidation()));
          },
        ),
        //GetXThemes
        ElevatedButton(
          child: const Text("GetX Validation Themes:Themes設定"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GetXThemes()));
          },
        ),
      ]),
    );
  }
}
