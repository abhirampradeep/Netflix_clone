import 'package:flutter/material.dart';
import 'package:net/domain/models/coming.dart';
import 'package:net/services/comingsoon_service.dart';

class ComingProvider extends ChangeNotifier {
  ComingsoonService _service = ComingsoonService();
  bool isLoading = false;
  List<ComingSoon> _comingsoon = [];

  List<ComingSoon> get comingsoon => _comingsoon;

  Future<void> getAllComing() async {
    isLoading = true;

    try {
      final response = await _service.getAll();
      _comingsoon = response;
      isLoading = false;
      print('Data fetched successfully: $_comingsoon');
    } catch (e) {
      print('Error fetching data: $e');
      isLoading = false; // Set isLoading to false even on error
      throw e; // Rethrow the exception to propagate it
    }
    notifyListeners();
  }
}
