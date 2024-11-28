import 'package:flutter/material.dart';
import 'package:netflix_clone/controllers/home_controller.dart';
import 'package:netflix_clone/views/home/movie_card.dart';
import 'package:netflix_clone/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = HomeController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: Text('Polar Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: controller.fetchAllMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.red,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading movies'));
          } else {
            return ListView.builder(
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: controller.movies[index]);
              },
            );
          }
        },
      ),
    );
  }
}
