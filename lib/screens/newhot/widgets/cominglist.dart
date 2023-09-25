import 'package:flutter/material.dart';
import 'package:net/domain/models/coming.dart';
import 'package:net/provider/coming_provider.dart';
import 'package:provider/provider.dart';

class ComingSoonListPage extends StatefulWidget {
  @override
  State<ComingSoonListPage> createState() => _ComingSoonListPageState();
}

class _ComingSoonListPageState extends State<ComingSoonListPage> {
  @override
  Widget build(BuildContext context) {
    // Use the Consumer widget to access the ComingProvider
    return Consumer<ComingProvider>(
      builder: (context, comingProvider, child) {
        return Scaffold(
          body: _buildComingSoonList(comingProvider),
        );
      },
    );
  }

  Widget _buildComingSoonList(ComingProvider comingProvider) {
    if (comingProvider.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final comingSoonList = comingProvider.comingsoon;

      if (comingSoonList.isEmpty) {
        return Center(
          child: Text('No data available.'),
        );
      } else {
        return ListView.separated(
          itemCount: comingSoonList.length,
          separatorBuilder: (BuildContext context, int index) =>
              Divider(), // Add a separator
          itemBuilder: (context, index) {
            final movie = comingSoonList[index];
            return ListTile(
              leading: Image.network(movie.imageUrl),
              title: Text(movie.Comingsoontitle),
              subtitle: Text('Release Date: ${movie.date.toString()}'),
            );
          },
        );
      }
    }
  }
}
