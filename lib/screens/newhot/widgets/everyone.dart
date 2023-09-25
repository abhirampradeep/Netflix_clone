import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/provider/everyone_provider.dart';
import 'package:provider/provider.dart';

class EveryOneWatching extends StatefulWidget {
  @override
  _EveryOneWatchingState createState() => _EveryOneWatchingState();
}

class _EveryOneWatchingState extends State<EveryOneWatching> {
  final FilmProvider filmProvider = FilmProvider();

  @override
  void initState() {
    super.initState();
    filmProvider.fetchFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<FilmProvider>(
          builder: (context, filmProvider, child) {
            if (filmProvider.films.isEmpty) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: filmProvider.films.length,
                itemBuilder: (context, index) {
                  final film = filmProvider.films[index];
                  return ListTile(
                    title: Text(
                      film.title,
                      style: TextStyle(color: white),
                    ),
                    subtitle: Text(film.description),
                    leading: Image.network(film.imageUrl),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
