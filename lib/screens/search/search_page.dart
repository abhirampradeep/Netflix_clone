import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net/screens/search/search_result.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(.5),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: TextStyle(color: Colors.white),
          ),
          // Expanded(child: const SearchIdlePage()),
          Expanded(child: const SearchResult()),
        ],
      ),
    )));
  }
}
