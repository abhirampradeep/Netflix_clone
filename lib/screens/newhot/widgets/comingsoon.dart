import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:net/colors/colors.dart';
import 'package:net/provider/coming_provider.dart'; // Import your ComingProvider
import 'package:net/screens/newhot/widgets/filmdesc.dart';
import 'package:provider/provider.dart';

class Comingsoonwidget extends StatefulWidget {
  const Comingsoonwidget({
    Key? key,
    required this.size,
  });

  final Size size;

  @override
  State<Comingsoonwidget> createState() => _ComingsoonwidgetState();
}

class _ComingsoonwidgetState extends State<Comingsoonwidget> {
  @override
  // void initState() {
  //   super.initState();
  //   // Fetch data when the widget is initialized
  //   Provider.of<ComingProvider>(context, listen: false).getAllComing();
  // }

  String errorMessage = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      await Provider.of<ComingProvider>(context, listen: false).getAllComing();
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
    return Consumer<ComingProvider>(
      builder: (context, provider, child) {
        final isLoading = provider.isLoading;
        final comingSoonList = provider.comingsoon;

        return Scaffold(
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: comingSoonList.length,
                    itemBuilder: (context, index) {
                      final comingSoon = comingSoonList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Display the date here
                              SizedBox(
                                width: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "FEB ${comingSoonList.length}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "11",
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 4,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: widget.size.width - 50,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          height: 200,
                                          child: Image.network(
                                            comingSoon.imageUrl,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 20,
                                          right: 10,
                                          child: CircleAvatar(
                                            radius: 22,
                                            backgroundColor:
                                                Colors.black.withOpacity(.1),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.volume_down_rounded,
                                                color: background,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Display the title here
                                              Text(
                                                comingSoon.Comingsoontitle,
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 24,
                                                  letterSpacing: -2,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'Coming on Friday',
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.9),
                                                  fontSize: 14,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        // Add your newpageicon widgets here
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FilmShortDescription(
                                      title: comingSoon.Comingsoontitle,
                                      description: "hello",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey, // Add a divider between items
                          ),
                        ],
                      );
                    },
                  ));
      },
    );
  }
}
