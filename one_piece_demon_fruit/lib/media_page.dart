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
        title: Text("Fruits du Démon", style: TextStyle(fontSize: 24)),
        bottom: TabBar(
          controller: _tabController,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            fruit.name,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              fruit.image,
                              width: double.infinity,
                              height: 120, // ✅ Taille ajustée
                              fit: BoxFit
                                  .contain, // ✅ Garde toute l’image visible
                            ),
                          ),
                          SizedBox(height: 10),
                          ExpansionTile(
                            title: Text(
                              "Détails",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_drop_down, size: 30),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Utilisateur :",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 5),
                                            Text(
                                              fruit.user,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                            fruit.userImage,
                                            width:
                                                100, // ✅ Agrandi pour mise en valeur
                                            height:
                                                100, // ✅ Agrandi pour mise en valeur
                                            fit: BoxFit
                                                .contain, // ✅ Garde toute l’image
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      fruit.description,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : null,
                              size: 30,
                            ),
                            onPressed: () {
                              favoritesProvider.toggleFavorite(fruit.name);
                            },
                          ),
                        ],
                      ),
                    ),
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
