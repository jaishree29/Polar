import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/constants.dart';
import '../../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    String cleanSummary(String htmlString) {
      return RegExp(r'<[^>]*>').hasMatch(htmlString)
          ? htmlString.replaceAll(RegExp(r'<[^>]*>'), '')
          : htmlString;
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/details',
            arguments: movie,
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movie.imageUrl.isNotEmpty
                ? Image.network(
                    movie.imageUrl,
                    height: 100,
                    width: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 100,
                        width: 70,
                        color: Colors.grey,
                        child: Icon(Icons.broken_image, color: Colors.white),
                      );
                    },
                  )
                : Image.asset(
                    placeholderImage,
                    height: 100,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
            SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    movie.title,
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    cleanSummary(movie.summary),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}
