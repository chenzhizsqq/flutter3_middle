import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXGetPage extends StatelessWidget {
  const GetXGetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GetX GetPage'),
        ),
        body: GetMaterialApp(
          title: 'GetX Routing Example',
          initialRoute: '/', //定义初始画面的路径是'/'
          /**
           * getPages： 设置有多少各页面
           */
          getPages: [
            GetPage(name: '/', page: () => const GetXGetPageHome()),
            GetPage(name: '/second', page: () => const GetXGetPageSecond()),
            GetPage(name: '/third/', page: () => const GetXGetPageThird()),
          ],
        ));
  }
}

class GetXGetPageHome extends StatelessWidget {
  const GetXGetPageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('是 / 的页面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to second page'),
              /**
               * Get.toNamed ： 走去'/second' 的页面上
               */
              onPressed: () => Get.toNamed('/second'),
            ),
            ElevatedButton(
                child: const Text('Go to third page'),
                /**
               * Get.toNamed ： 走去'/third' 的页面上
               */
                onPressed: () {
                  String data = 'This is some data!';
                  Get.toNamed('/third', arguments: data);
                }),
          ],
        ),
      ),
    );
  }
}

class GetXGetPageSecond extends StatelessWidget {
  const GetXGetPageSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go back'),
          onPressed: () => Get.back(),
        ),
      ),
    );
  }
}

class GetXGetPageThird extends StatelessWidget {
  const GetXGetPageThird({super.key});

  @override
  Widget build(BuildContext context) {
    final String data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data),
            ElevatedButton(
              child: const Text('Go back'),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
