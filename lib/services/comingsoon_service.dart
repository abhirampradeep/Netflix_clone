import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:net/domain/models/coming.dart';

class ComingsoonService {
  Future<List<ComingSoon>> getAll() async {
    final url =
        "https://api.themoviedb.org/3/movie/upcoming?api_key=577aa4329fd01a422022bc2176856782";

    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body)['results'];

        final comingsoon = jsonList.map((e) {
          return ComingSoon(
            imageUrl: 'https://image.tmdb.org/t/p/w500/${e['poster_path']}',
            date: DateTime.parse(e['release_date']),
            Comingsoontitle: e['title'],
          );
        }).toList();

        return comingsoon;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
