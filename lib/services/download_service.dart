import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:net/domain/downloads/models/down.dart';

class DownloadService {
  Future<List<Download>> getAll() async {
    final url =
        "https://api.themoviedb.org/3/trending/all/day?api_key=24fc761dce8176508050128e25eced4b";

    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body)['results'] as List;

        final downloads = json.map((e) {
          return Download(
              image: 'https://image.tmdb.org/t/p/w500/${e['poster_path']}');
        }).toList();

        return downloads;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
