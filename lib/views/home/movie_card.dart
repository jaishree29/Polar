import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constants.dart';
import '../../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: movie.imageUrl.isNotEmpty
            ? Image.network(
                movie.imageUrl,
              )
            : Image.asset(
                placeholderImage,
                // height: 30,
              ),
        title: Text(movie.title),
        subtitle:
            Text(movie.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () {
          Navigator.pushNamed(context, '/details', arguments: movie);
        },
      ),
    );
  }
}
