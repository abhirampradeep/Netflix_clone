import 'package:flutter/material.dart';
import 'package:net/domain/models/everyone.dart';
import 'package:net/services/everyone_service.dart';

class FilmProvider extends ChangeNotifier {
  final FilmService filmService = FilmService();
  List<FilmModel> _films = [];

  List<FilmModel> get films => _films;

  Future<void> fetchFilms() async {
    try {
      _films = await filmService.fetchFilms();
      _films = films;
      print('Data fetched successfully: $_films');

      notifyListeners();
    } catch (e) {
      print("Error fetching films: $e");
    }
  }
}
