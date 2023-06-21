import 'package:flutter/material.dart';
import 'package:flutter_peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas en cines"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Listado de películas
            CardSwiper(),

            // Populares
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
