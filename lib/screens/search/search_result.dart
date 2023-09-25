import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:net/provider/searchresult_provider.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

class SearchResultGridView extends StatefulWidget {
  @override
  _SearchResultGridViewState createState() => _SearchResultGridViewState();
}

class _SearchResultGridViewState extends State<SearchResultGridView> {
  @override
  void initState() {
    super.initState();
    // Trigger data fetching when the widget is first built
    Provider.of<SearchresultProvider>(context, listen: false)
        .getAllSearchResults();
  }

  @override
  Widget build(BuildContext context) {
    final searchresultProvider = Provider.of<SearchresultProvider>(context);

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Show the GridView if data is available
            if (searchresultProvider.search.isNotEmpty)
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150,
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: searchresultProvider.search.length,
                itemBuilder: (context, index) {
                  final imageUrl = searchresultProvider.search[index].image;
                  return Container(
                    width: 250, // Set the width to your desired value
                    height: 350, // Set the height to your desired value
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fill, // Adjust the fit as needed
                    ),
                  );
                },
              ),
            // Show shimmer effect while loading
            if (searchresultProvider.isLoading)
              ShimmerGridView(), // Custom widget for shimmer effect
            // Show a message when no data is available
            if (!searchresultProvider.isLoading &&
                searchresultProvider.search.isEmpty)
              Text(
                'No data available.',
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}

// Create a custom widget for shimmer effect
class ShimmerGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 150,
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 15, // You can set the number of shimmer items
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            height: 350,
            color: Colors.white,
          );
        },
      ),
    );
  }
}
