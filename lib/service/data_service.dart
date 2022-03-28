import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_flutter/model/article.dart';

// api kita
String apiKey = '0ced51aa43234ab38229dcc9e6c29841';
String baseUrl = 'https://newsapi.org/v2';

class News{

  // future harus ditambahkan async
  Future<List<Article>?> getNews() async{
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;

      // list dibuat map agar key-value
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else{
      throw Exception("Data gagal diambil");
    }
  }

  Future<List<Article>?> getNewsCategory(String category) async{
    List <Article>? list;
    String url = '$baseUrl/top-headlines/sources?$category$apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data =jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else{
      throw Exception("error can't get data");
    }
  }
}