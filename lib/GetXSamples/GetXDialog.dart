import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 依存性のバインド用のクラス
class GetXDialogUserRepository {
  void login(String username, String password) {
    // ログイン処理の実装
    print('ログイン成功: $username');
  }
}

// 依存性の解決用のコントローラークラス
class GetXDialogLoginController extends GetxController {
  final GetXDialogUserRepository userRepository;

  GetXDialogLoginController(this.userRepository);

  void login(String username, String password) {
    userRepository.login(username, password);
  }

  void showDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('ダイアログ'),
        content: Text('ダイアログのコンテンツ'),
        actions: [
          TextButton(
            onPressed: () {
              print('Get.back');
              Get.back();
            },
            child: Text('閉じる'),
          ),
        ],
      ),
    );
  }
}

// ログイン画面
class GetXDialogLogin extends StatelessWidget {
  final GetXDialogLoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('ログイン'),
          onPressed: () {
            loginController.login('username', 'password');
            loginController.showDialog();
          },
        ),
      ),
    );
  }
}

class GetXDialogLoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: GetXDialogLogin(),
    );
  }
}
