import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w6_assignment/EX-2-START-CODE/dto/post_dto.dart';
import 'package:w6_assignment/EX-2-START-CODE/model/post.dart';

import 'post_repository.dart';

class HttpPostsRepository implements PostRepository {
  @override
  Future<List<Post>> getPost(int postId) async {
    List<Post> postList = [];

    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    try {
      // fetch the data from the url
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        for (var item in data) {
          // load the json to PostDto
          PostDto postDto = PostDto.fromJson(item);
          //convet the PostDto to Post
          postList.add(Post.fromDto(postDto));
        }
      } else {
        throw Exception("Failed to load post");
      }
    } catch (e) {
      throw Exception(e);
    }
    return postList;
  }
}
