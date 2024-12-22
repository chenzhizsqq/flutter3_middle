import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * 
型  	    具体例
RxString	var greeting = 'Hello'.obs;
RxInt	    var counter = 0.obs;
RxDouble	var rating = 3.5.obs;
RxBool	  var isChecked = false.obs;
RxList	  var items = <String>[].obs;
RxMap	    var info = {'name': 'GetX'}.obs;
RxSet	    var names = <String>{}.obs;
Rx<T>	    var user = User().obs;
 */
class GetXEasyController extends GetxController {
  //所以就是在int后面加一个“.obs”，就可以了。
  var count = 0.obs;

  void increment() {
    count++;
  }
}

class GetXEasy extends StatelessWidget {
  /**
   * 在这个例子中，我们使用了 GetX 的依赖注入（Get.put）和状态管理（Obx）功能来实现一个简单的计数器应用。
   * 通过 Get.put 方法将控制器注入到视图中，并使用 Obx 监听和响应状态变化。
   */
  final GetXEasyController controller = Get.put(GetXEasyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Easy'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            'Count: ${controller.count}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
