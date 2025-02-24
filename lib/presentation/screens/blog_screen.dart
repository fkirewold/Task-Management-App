import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/widgets/text_widget.dart';
import 'package:http/http.dart' as http;

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {

List<dynamic> posts = [];
bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
    fetchPosts();
  }
  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
    });
  }
  Future<void> fetchPosts() async {
    if (!_isConnected) {
      return; // Don't fetch data if there's no internet
    }
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        posts = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextWidget(
            text: 'My Blog',
            color: Colors.white,
            fontSize: 18,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          )),
      body: _isConnected? (posts.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ListTile(
                      title: Text(post['title']),
                      subtitle: Text(post['body']),
                    );
                  },
                ))
          :Center(
              child: TextWidget(
               text:'Looks like you\'re not connected to the internet',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                           
              ),
            ),
      
    );
  }
}
