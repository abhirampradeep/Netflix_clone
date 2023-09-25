import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/provider/download_provider.dart';
import 'package:net/screens/moviepage/moviedesc.dart';
import 'package:net/screens/widgets/main_card.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePageTitleContent extends StatefulWidget {
  const HomePageTitleContent({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePageTitleContent> createState() => _HomePageTitleContentState();
}

class _HomePageTitleContentState extends State<HomePageTitleContent> {
  String errorMessage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      await Provider.of<DownloadProvider>(context, listen: false)
          .getAllDownloads();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false; // Set isLoading to false even on error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final downloadProvider = Provider.of<DownloadProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.w900, fontSize: 22, color: white),
          ),
        ),
        const SizedBox(height: 10),
        if (isLoading)
          LimitedBox(
            maxHeight: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the ImageDisplayPage with the selected image URL
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDescription(
                          imageUrl: downloadProvider.download[index].image,
                        ),
                      ),
                    );
                  },
                  child: ShimmeringHomepageCard(),
                );
              },
            ),
          )
        else if (downloadProvider.download.isNotEmpty)
          LimitedBox(
            maxHeight: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: downloadProvider.download.length,
              itemBuilder: (context, index) {
                final imageUrl = downloadProvider.download[index].image;
                return GestureDetector(
                  onTap: () {
                    // Navigate to the ImageDisplayPage with the selected image URL
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDescription(
                          imageUrl: imageUrl,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: HomepageCard(imageurl: imageUrl),
                  ),
                );
              },
            ),
          )
        else
          LimitedBox(
            maxHeight: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ShimmeringHomepageCard();
              },
            ),
          ), // ShimmeringHomepageCard(),
      ],
    );
  }
}

class ShimmeringHomepageCard extends StatelessWidget {
  const ShimmeringHomepageCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8), // Adjust the padding as needed
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!, // Specify base color
        highlightColor: Colors.grey[100]!, // Specify highlight color
        child: Container(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300]!, // Specify shimmer background color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
