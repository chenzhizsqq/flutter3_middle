import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'GetXSamples/GetXMenu.dart';
import 'package:get/get.dart';
import 'GetXSamples/GetXDialog.dart';

//void main() => runApp(const MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 依存性のバインド
  Get.put(GetXDialogUserRepository());
  Get.put(GetXDialogLoginController(Get.find<GetXDialogUserRepository>()));
  runApp(
    // 为了安装 Riverpod，我们需要将这个小组件添加到所有的小组件之上。
    // 它不应该在 “MyApp” 内部，而是作为 “runApp” 的直接参数。
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //打开menu
      home: SampleMenu(),
    );
  }
}

class SampleMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
      ),
      body: ListView(children: <Widget>[
        ElevatedButton(
          child: const Text("MyHomePage"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Flutter Demo Home Page')));
          },
        ),
        ElevatedButton(
          child: const Text("GetX Menu"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GetXMenu()));
          },
        ),
      ]),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Row 1'),
            Text('Row 2'),
            Text('Row 3'),
            Text('Row 4'),
            SizedBox(height: 20),
            DialogExample(),
          ],
        ),
      ),
    );
  }
}

//
class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          icon: const Icon(Icons.ac_unit_sharp), //图标
          title: const Text('AlertDialog'),
          titlePadding: const EdgeInsets.all(20),
          titleTextStyle: const TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          content: const Text('我是AlertDialog对话框'),
          contentPadding: const EdgeInsets.all(40),
          contentTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
          backgroundColor: const Color(0xffffffff),
          elevation: 10.0,
          actionsOverflowDirection: VerticalDirection.down,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('确定')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('取消'))
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
