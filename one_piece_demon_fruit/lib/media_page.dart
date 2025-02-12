import 'package:flutter/material.dart';
import 'fruit.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, String> fruitDescriptions = {
    "Logia":
        "Les Fruits du Démon de type Logia permettent à leur utilisateur de se transformer et de contrôler un élément naturel.",
    "Zoan":
        "Les Fruits du Démon de type Zoan permettent à leur utilisateur de se transformer en un animal ou en une forme hybride.",
    "Paramecia":
        "Les Fruits du Démon de type Paramecia confèrent divers pouvoirs, modifiant le corps ou l'environnement de l'utilisateur.",
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits du Démon"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Logia"),
            Tab(text: "Zoan"),
            Tab(text: "Paramecia"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FruitList(type: "Logia", description: fruitDescriptions["Logia"]!),
          FruitList(type: "Zoan", description: fruitDescriptions["Zoan"]!),
          FruitList(
              type: "Paramecia", description: fruitDescriptions["Paramecia"]!),
        ],
      ),
    );
  }
}

class FruitList extends StatelessWidget {
  final String type;
  final String description;

  FruitList({required this.type, required this.description});

  @override
  Widget build(BuildContext context) {
    List<Fruit> fruits =
        allFruits.where((fruit) => fruit.type == type).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              final fruit = fruits[index];
              return Consumer<FavoritesProvider>(
                builder: (context, favoritesProvider, child) {
                  bool isFavorite = favoritesProvider.isFavorite(fruit.name);
                  return ExpansionTile(
                    leading: Image.asset(fruit.image),
                    title: Text(fruit.name),
                    trailing: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        favoritesProvider.toggleFavorite(fruit.name);
                      },
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 10),
                                Image.asset(
                                  fruit.userImage,
                                  width: 80,
                                  height: 80,
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
        ),
      ],
    );
  }
}
