import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_tutorial/api_bloc/model/Post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {

  final BASE_URL = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(Uri.parse(BASE_URL));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
            id: e['id'] as int,
            postId: e['postId'] as int,
            email: e['email'] as String,
            body: e['body']as String,
          );
        },).toList();
      }
    }on SocketException{
      throw Exception('error while Socket');
    }on TimeoutException{
      throw Exception('error while Timeout');
    }
    throw Exception('error while fetching data');
  }
}
