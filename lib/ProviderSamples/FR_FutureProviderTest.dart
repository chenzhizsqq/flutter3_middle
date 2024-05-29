import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// 定义一个 FutureProvider
final futureProvider = FutureProvider<String>((ref) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['title'];
  } else {
    throw Exception('Failed to load data');
  }
});

class FR_FutureProviderTest extends ConsumerWidget {
  const FR_FutureProviderTest({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureData = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider Example'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: futureData.when(
          data: (data) => Text(data),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
