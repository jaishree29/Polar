import 'package:flutter/material.dart';
import 'package:netflix_clone/controllers/search_controller.dart';
import 'package:netflix_clone/views/home/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final PSearchController _controller = PSearchController();
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;

  void _search() async {
    setState(() => _isLoading = true);
    await _controller.searchMovies(_searchController.text);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.red,
              controller: _searchController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red
                  )
                ),
                hintText: 'Search movies...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search, color: Colors.red,),
                  onPressed: _search,
                ),
              ),
            ),
          ),
          if (_isLoading)
            Center(child: CircularProgressIndicator())
          else
            Expanded(
              child: ListView.builder(
                itemCount: _controller.searchResults.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: _controller.searchResults[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
