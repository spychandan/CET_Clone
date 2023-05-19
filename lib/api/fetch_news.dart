import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiKeys{

   static Future<Map<String, String>> fetchNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2023-04-19&sortBy=publishedAt&apiKey=dfb90f2f9f5747b5adf255ae0c70b0e4');

    final response = await http.get(url);
     if (response.statusCode == 200) {
     var jsonResponse = json.decode(response.body);
     Map<String, String> newsPublished = {};
    //   for (var title in jsonResponse['articles'].keys) {
    //     newsPublished[title] = jsonResponse['articles'][title]['publishedAt'];
    //     print(title);
    //   }
    //  // print(newsPublished);
      if (jsonResponse.containsKey('articles')) {
        final articles = jsonResponse['articles'];
        for (var article in articles) {
          if (article.containsKey('title') &&
              article.containsKey('publishedAt')) {
            final title = article['title'];
            print(title);
            final publishedAt = article['publishedAt'];
            newsPublished[title] = publishedAt;
          }
        }
      }
      return newsPublished;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

}