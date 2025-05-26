import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/comment.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => Post.fromJson(e))
          .toList();
    } else {
      throw Exception('Error al cargar posts');
    }
  }

  static Future<List<Comment>> getComments(int postId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/comments?postId=$postId'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => Comment.fromJson(e))
          .toList();
    } else {
      throw Exception('Error al cargar comentarios');
    }
  }

  static Future<Post> addPost(Post post) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(post.toJson()),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al crear post');
    }
  }
}
