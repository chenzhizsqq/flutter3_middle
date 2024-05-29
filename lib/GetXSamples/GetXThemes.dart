import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXThemes extends StatelessWidget {
  const GetXThemes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'テーマの例',
      theme: ThemeData(
        // テーマの設定
        primaryColor: Colors.blue, // アクセントカラー
        fontFamily: 'Roboto', // フォントファミリー
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold), // タイトルのスタイル
          bodySmall: TextStyle(fontSize: 16.0), // 本文のスタイル
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
      ),
      home: const GetXThemesSetted(),
    );
  }
}

class GetXThemesSetted extends StatelessWidget {
  const GetXThemesSetted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('テーマの例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'プライマリーカラー',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 200,
              height: 50,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 40.0),
            Text(
              'アクセントカラー',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 200,
              height: 50,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(height: 40.0),
            Text(
              'フォントファミリー',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Roboto',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
