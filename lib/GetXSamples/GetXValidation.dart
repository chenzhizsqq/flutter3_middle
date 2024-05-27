import 'package:flutter/material.dart';
import 'package:get/get.dart';

// バリデーション用のクラス
class ValidationController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final RxBool isEmailValid = false.obs;

  void validateEmail(String email) {
    // 簡単なバリデーションの例：入力がメールアドレス形式かどうかを判定
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    isEmailValid.value = emailRegex.hasMatch(email);
  }
}

// バリデーション画面
class GetXValidation extends StatelessWidget {
  final ValidationController validationController =
      Get.put(ValidationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('バリデーション'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => TextField(
                  controller: validationController.textEditingController,
                  onChanged: (value) {
                    validationController.validateEmail(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'メールアドレス',
                    errorText: validationController.isEmailValid.value
                        ? null
                        : '有効なメールアドレスを入力してください',
                  ),
                )),
            ElevatedButton(
              child: Text('送信'),
              onPressed: () {
                if (validationController.isEmailValid.value) {
                  // バリデーションが成功した場合の処理
                  print(
                      'メールアドレス: ${validationController.textEditingController.text}');
                } else {
                  // バリデーションが失敗した場合の処理
                  print('バリデーションエラー');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
