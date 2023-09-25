import 'dart:math';
import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/provider/download_provider.dart';
import 'package:net/screens/widgets/appbarwidget.dart';
import 'package:provider/provider.dart';

class Downloads extends StatefulWidget {
  Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  final _WidgetsList = [
    const ScreenDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Download',
          CastIcon: Icon(Icons.cast),
          notificationsIcon: Icon(Icons.emoji_emotions),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (ctx, index) => _WidgetsList[index],
        separatorBuilder: (ctx, index) => const SizedBox(
          height: 25,
        ),
        itemCount: _WidgetsList.length,
      ),
    );
  }
}

class Section3 extends StatefulWidget {
  const Section3({
    super.key,
  });

  @override
  State<Section3> createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            padding: const EdgeInsets.only(top: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.blue,
            onPressed: () {},
            child: const Text(
              "Setup",
              style: TextStyle(color: white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        MaterialButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {},
          child: const Text(
            "See what you can download",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Section2 extends StatefulWidget {
  Section2({
    Key? key,
  }) : super(key: key);

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
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
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
            child: Text(
              "Introducing Downloads for you",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "We will download a personalized selection of movies and shows for you",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          // Display error message if there's an error
          if (errorMessage.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          // Use a Stack to overlay the circular progress indicator on images
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * .38,
                backgroundColor: Colors.grey,
              ),
              if (isLoading)
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
              if (!isLoading)
                DownloadsImageWidget(
                  margin: EdgeInsets.only(left: 130, bottom: 25),
                  imageIndex: 0,
                  angle: 22,
                ),
              if (!isLoading)
                DownloadsImageWidget(
                  margin: EdgeInsets.only(right: 130, bottom: 25),
                  imageIndex: 2,
                  angle: -22,
                ),
              if (!isLoading)
                DownloadsImageWidget(
                  margin: EdgeInsets.only(left: 0),
                  imageIndex: 1,
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Display a message when no images are available
          if (!isLoading &&
              errorMessage.isEmpty &&
              Provider.of<DownloadProvider>(context).download.isEmpty)
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "No images available.",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({
    super.key,
  });

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        Icon(Icons.settings, color: Colors.white),
        Text(
          "Screen Downloads",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatefulWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageIndex,
    this.angle = 0,
    required this.margin,
  }) : super(key: key);

  final int imageIndex;
  final double angle;
  final EdgeInsets margin;

  @override
  State<DownloadsImageWidget> createState() => _DownloadsImageWidgetState();
}

class _DownloadsImageWidgetState extends State<DownloadsImageWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final downloadProvider = Provider.of<DownloadProvider>(context);

    if (widget.imageIndex >= 0 &&
        widget.imageIndex < downloadProvider.download.length) {
      final imageUrl = downloadProvider.download[widget.imageIndex].image;

      return Transform.rotate(
        angle: widget.angle * pi / 180,
        child: Container(
          margin: widget.margin,
          width: size.width * 0.4,
          height: size.width * 0.58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              scale: 1,
              fit: BoxFit.cover, // Fill the container with the image
            ),
          ),
        ),
      );
    } else {
      // Display a placeholder image or any other widget when data is not available
      return Container(
        margin: widget.margin,
        width: size.width * 0.4,
        height: size.width * 0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey, // Placeholder color
        ),
        // You can customize the placeholder further, e.g., add an icon or text
        // child: Icon(Icons.image, size: 50, color: Colors.white),
      );
    }
  }
}
