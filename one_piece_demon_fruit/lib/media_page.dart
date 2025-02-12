import 'package:flutter/material.dart';
import 'fruit.dart';
import 'favorites_provider.dart';
import 'package:provider/provider.dart';

class MediaPage extends StatelessWidget {
  final List<Fruit> fruits = [
    Fruit(
      name: "Gomu Gomu no Mi",
      image: "assets/gomu-gomu-no-mi.jpg",
      description: "Donne un corps en caoutchouc.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fruits du Démon")),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          final provider = Provider.of<FavoritesProvider>(context);
          final isLiked = provider.isFavorite(fruit.name);

          return ListTile(
            leading: Image.asset(fruit.image, width: 50),
            title: Text(fruit.name),
            subtitle: Text(fruit.description),
            trailing: IconButton(
              icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
              color: isLiked ? Colors.red : null,
              onPressed: () {
                provider.toggleFavorite(fruit.name);
              },
            ),
          );
        },
      ),
    );
  }
}
