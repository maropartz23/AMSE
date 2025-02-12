import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'fruit.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Fruit> favoriteFruits = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favs = prefs.getString('favorites');
    if (favs != null) {
      setState(() {
        favoriteFruits = (jsonDecode(favs) as List)
            .map((item) => Fruit.fromJson(item))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fruits Likés")),
      body: ListView.builder(
        itemCount: favoriteFruits.length,
        itemBuilder: (context, index) {
          final fruit = favoriteFruits[index];
          return ListTile(
            leading: Image.asset(fruit.image),
            title: Text(fruit.name),
            subtitle: Text(fruit.description),
          );
        },
      ),
    );
  }
}
