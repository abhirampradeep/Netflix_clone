import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:net/domain/models/everyone.dart';

class FilmService {
  final String apiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=577aa4329fd01a422022bc2176856782"; // Replace with your TMDb API key

  Future<List<FilmModel>> fetchFilms() async {
    final response = await http.get(Uri.parse(apiUrl));
    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((filmData) {
        return FilmModel(
          title: filmData['title'],
          description: filmData['overview'],
          imageUrl:
              "https://image.tmdb.org/t/p/w500${filmData['poster_path']}", // Construct the full image URL
        );
      }).toList();
    } else {
      throw Exception('Failed to load films');
    }
  }
}
