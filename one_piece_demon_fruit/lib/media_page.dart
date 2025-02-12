import 'package:flutter/material.dart';
import 'fruit.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
          FruitList(type: "Logia"),
          FruitList(type: "Zoan"),
          FruitList(type: "Paramecia"),
        ],
      ),
    );
  }
}

class FruitList extends StatelessWidget {
  final String type;
  FruitList({required this.type});

  @override
  Widget build(BuildContext context) {
    List<Fruit> fruits =
        allFruits.where((fruit) => fruit.type == type).toList();

    return ListView.builder(
      itemCount: fruits.length,
      itemBuilder: (context, index) {
        final fruit = fruits[index];
        return ListTile(
          leading: Image.asset(fruit.image),
          title: Text(fruit.name),
          subtitle: Text(fruit.description),
        );
      },
    );
  }
}
