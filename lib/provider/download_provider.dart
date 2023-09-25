import 'package:flutter/material.dart';
import 'package:net/domain/models/download.dart';
import 'package:net/domain/models/download.dart';
import 'package:net/services/download_service.dart';

import '../domain/models/download.dart';
import '../domain/models/download.dart';

class DownloadProvider extends ChangeNotifier {
  DownloadService _service = DownloadService();
  bool isLoading = false;
  late List<Download> _download = [];

  List<Download> get download => _download;

  Future<void> getAllDownloads() async {
    isLoading = true;

    try {
      final response = await _service.getAll();
      _download = response;
      isLoading = false;
      print('Data fetched successfully: $_download');
    } catch (e) {
      print('Error fetching data: $Error');
    }
    notifyListeners();
  }
}
