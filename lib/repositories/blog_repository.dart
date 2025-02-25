import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:todo/models/blog_model.dart';

class BlogRepository {
  Future<List<BlogModel>> fetchPosts() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw 'No Internet';
    }
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final blogs = data.map((d) => BlogModel.fromMap(d)).toList();
      return blogs;
    } else {
      throw 'Failed to load posts';
    }
  }
}
