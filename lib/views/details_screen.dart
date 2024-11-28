import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constants.dart';
import '../../models/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                movie.imageUrl.isNotEmpty ? movie.imageUrl : placeholderImage,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(placeholderImage, height: 200,);
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              movie.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              movie.summary
                  .replaceAll(RegExp(r'<[^>]*>'), ''),
            ),
          ],
        ),
      ),
    );
  }
}
