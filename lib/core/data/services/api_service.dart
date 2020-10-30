import 'dart:convert';

import 'package:state_hero/features/quiz/data/models/category.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = "https://nest-quiz-test.herokuapp.com";

  Future<List<Category>> getCategories() async {
    final categoryUrl = '$url/categories';
    final res = await http.get(categoryUrl);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return List<Category>.from(data.map((cat) => Category.fromJson(cat)));
    } else {
      return null;
    }
  }

  Future<List<Question>> getQuestion({String categoryId, int limit=10}) async {
    String qurl = '$url/questions?limit=$limit';
    if(categoryId != null) {
      qurl = '$qurl&categoryId=$categoryId';
    }
    final res = await http.get(qurl);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return List<Question>.from(data.map((que) => Question.fromJson(que)));
    } else {
      return null;
    }

  }
}
