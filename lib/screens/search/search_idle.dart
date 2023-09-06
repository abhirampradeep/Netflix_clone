import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net/screens/widgets/SearchPageTitle.dart';

import '../../colors/colors.dart';

const imgUrl =
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=';

class SearchIdlePage extends StatelessWidget {
  const SearchIdlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitle(
          title: "Top Searches",
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => const SizedBox(
                    height: 15,
                  ),
              itemCount: 15),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: 80,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imgUrl))),
        ),
        const Text(
          "Movie Name",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        CircleAvatar(
          backgroundColor: white,
          radius: 20,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 18,
            child: Icon(
              CupertinoIcons.play_fill,
              color: white,
            ),
          ),
        )
      ],
    );
  }
}
