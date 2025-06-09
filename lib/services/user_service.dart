import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  static Future<User> fetchUser(int userId) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Error al cargar usuario');
    }
  }
}