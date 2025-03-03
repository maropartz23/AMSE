import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exo6 extends StatefulWidget {
  @override
  _Exo6State createState() => _Exo6State();
}

class _Exo6State extends State<Exo6> {
  int gridSize = 3;
  List<Tile> tiles = [];
  int emptyTileIndex = 0;

  @override
  void initState() {
    super.initState();
    _generateTiles();
  }

  void _generateTiles() {
    setState(() {
      tiles = List<Tile>.generate(gridSize * gridSize, (index) {
        return Tile.randomColor(index + 1);
      });

      // Place la tuile vide à une position aléatoire
      emptyTileIndex = math.Random().nextInt(gridSize * gridSize);
      tiles[emptyTileIndex] = Tile.empty();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exo 6: Début taquin'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridSize,
                childAspectRatio: 1.0,
              ),
              itemCount: tiles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _moveTile(index),
                  child: TileWidget(tiles[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Taille du plateau: $gridSize x $gridSize'),
                Slider(
                  value: gridSize.toDouble(),
                  min: 2,
                  max: 6,
                  divisions: 4,
                  label: gridSize.toString(),
                  onChanged: (double newValue) {
                    setState(() {
                      gridSize = newValue.round();
                      _generateTiles();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _generateTiles,
      ),
    );
  }

  void _moveTile(int index) {
    int emptyRow = emptyTileIndex ~/ gridSize;
    int emptyCol = emptyTileIndex % gridSize;
    int tileRow = index ~/ gridSize;
    int tileCol = index % gridSize;

    if ((tileRow == emptyRow &&
            (tileCol == emptyCol - 1 || tileCol == emptyCol + 1)) ||
        (tileCol == emptyCol &&
            (tileRow == emptyRow - 1 || tileRow == emptyRow + 1))) {
      setState(() {
        Tile temp = tiles[index];
        tiles[index] = tiles[emptyTileIndex];
        tiles[emptyTileIndex] = temp;
        emptyTileIndex = index;
      });
    }
  }
}

class Tile {
  late Color? color;
  late int number;

  Tile(this.color, this.number);

  Tile.empty() : this(null, 0);

  Tile.randomColor(int number) {
    this.color = Color.fromARGB(255, math.Random().nextInt(255),
        math.Random().nextInt(255), math.Random().nextInt(255));
    this.number = number;
  }
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tile.color ?? Colors.grey[300],
      child: Center(
        child: tile.color == null
            ? Icon(Icons.close, color: Colors.grey[600])
            : Text(
                '${tile.number}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Exo6(),
    ));
