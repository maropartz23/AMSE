import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart';
import 'fruit.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fruits Likés")),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          List<Fruit> favoriteFruits = allFruits
              .where(
                  (fruit) => favoritesProvider.favorites.contains(fruit.name))
              .toList();

          return ListView.builder(
            itemCount: favoriteFruits.length,
            itemBuilder: (context, index) {
              final fruit = favoriteFruits[index];
              return ExpansionTile(
                leading: Image.asset(fruit.image),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(fruit.name),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Utilisateur: ${fruit.user}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Image.asset(
                              fruit.userImage,
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(fruit.description),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
