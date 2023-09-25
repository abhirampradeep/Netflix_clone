import 'package:flutter/material.dart';
import 'package:net/domain/models/searchresult.dart';
import 'package:net/services/searchresult_service.dart';

class SearchresultProvider extends ChangeNotifier {
  SearchResultService _service = SearchResultService();
  bool _isLoading = false; // Use a private variable for isLoading
  List<Searchresult> _searchresult = [];

  bool get isLoading => _isLoading; // Getter for isLoading
  List<Searchresult> get search => _searchresult;

  Future<void> getAllSearchResults() async {
    _isLoading = true; // Set isLoading to true when data fetching starts
    notifyListeners(); // Notify listeners to trigger a rebuild

    try {
      final response = await _service.getAll();
      _searchresult = response;
      _isLoading =
          false; // Set isLoading to false when data fetching is complete
      print('Data fetched successfully: $_searchresult');
    } catch (e) {
      print('Error fetching data: $e');
      _isLoading = false; // Set isLoading to false even on error
      throw e; // Rethrow the exception to propagate it
    }
    notifyListeners(); // Notify listeners again to trigger a rebuild
  }
}
