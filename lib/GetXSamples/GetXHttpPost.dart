import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ポストモデル
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// 依存性のバインド用のクラス
class PostRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}

// 依存性の解決用のコントローラークラス
class HomeController extends GetxController {
  final PostRepository postRepository;

  HomeController(this.postRepository);

  final posts = <Post>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      List<Post> fetchedPosts = await postRepository.fetchPosts();
      posts.assignAll(fetchedPosts);
    } catch (e) {
      print(e);
    }
  }
}

// ホーム画面
class GetXHttpPost extends StatelessWidget {
  final HomeController homeController =
      Get.put(HomeController(PostRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Http Post'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: homeController.posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(homeController.posts[index].title),
              leading: Text((homeController.posts[index].id).toString()),
              subtitle: Text(homeController.posts[index].body),
            );
          },
        ),
      ),
    );
  }
}
