import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];
  bool isLoading = false;

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    isLoading = true;
    notifyListeners();
    _posts = await ApiService.getPosts();
    isLoading = false;
    notifyListeners();
  }

  Future<void> addPost(Post post) async {
    final newPost = await ApiService.addPost(post);
    _posts.insert(0, newPost);
    notifyListeners();
  }
}
