import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// 创建一个 ChangeNotifier 类
class DataModel extends ChangeNotifier {
  String? data;
  bool isLoading = true;
  String? error;

  DataModel() {
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        data = jsonData['title'];
      } else {
        error = 'Failed to load data';
      }
    } catch (e) {
      error = 'Failed to load data';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class FutureTest extends StatelessWidget {
  const FutureTest({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Test'),
        ),
        body: Center(
          //ChangeNotifierProvider：用于管理 ChangeNotifier 的全局状态。
          child: ChangeNotifierProvider(
            create: (_) => DataModel(),
            child: const MaterialApp(
              title: 'Future Test',
              home: _FutureTest(),
            ),
          ),
        ));
  }
}

class _FutureTest extends StatelessWidget {
  const _FutureTest({super.key});
  @override
  Widget build(BuildContext context) {
    //Provider：通用的提供器，可以用于提供任何类型的对象。
    final dataModel = Provider.of<DataModel>(context);

    return Scaffold(
      body: Center(
        child: dataModel.isLoading
            ? const CircularProgressIndicator()
            : dataModel.error != null
                ? Text('Error: ${dataModel.error}')
                : Text(dataModel.data ?? ''),
      ),
    );
  }
}
