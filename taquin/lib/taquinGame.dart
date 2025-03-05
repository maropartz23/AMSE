import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exo7 extends StatefulWidget {
  @override
  _Exo7State createState() => _Exo7State();
}

class _Exo7State extends State<Exo7> {
  int gridSize = 3;
  List<Tile> tiles = [];
  int emptyTileIndex = 0;
  int moveCount = 0;
  bool isSolved = false;
  List<List<Tile>> history = [];
  String imageURL = 'https://picsum.photos/512';

  @override
  void initState() {
    super.initState();
    _generateTiles();
  }

  void _generateTiles() {
    setState(() {
      tiles = List<Tile>.generate(gridSize * gridSize, (index) {
        return Tile(
          imageURL: imageURL,
          alignment: Alignment(
            -1.0 + (index % gridSize) * (2.0 / (gridSize - 1)),
            -1.0 + (index ~/ gridSize) * (2.0 / (gridSize - 1)),
          ),
          number: index + 1,
        );
      });

      emptyTileIndex = gridSize * gridSize - 1;
      tiles[emptyTileIndex] = Tile.empty();

      _shuffleTiles(20);
      moveCount = 0;
      isSolved = false;
      history.clear();
    });
  }

  void _shuffleTiles(int difficulty) {
    for (int i = 0; i < difficulty; i++) {
      List<int> possibleMoves = _getPossibleMoves();
      int move = possibleMoves[math.Random().nextInt(possibleMoves.length)];
      _swapTiles(move, false);
    }
    _moveEmptyTileToBottomRight();
  }

  void _moveEmptyTileToBottomRight() {
    int targetIndex = gridSize * gridSize - 1;
    while (emptyTileIndex != targetIndex) {
      List<int> possibleMoves = _getPossibleMoves();
      int move = possibleMoves[math.Random().nextInt(possibleMoves.length)];
      _swapTiles(move, false);
    }
  }

  List<int> _getPossibleMoves() {
    List<int> possibleMoves = [];
    int emptyRow = emptyTileIndex ~/ gridSize;
    int emptyCol = emptyTileIndex % gridSize;

    if (emptyRow > 0) possibleMoves.add(emptyTileIndex - gridSize);
    if (emptyRow < gridSize - 1) possibleMoves.add(emptyTileIndex + gridSize);
    if (emptyCol > 0) possibleMoves.add(emptyTileIndex - 1);
    if (emptyCol < gridSize - 1) possibleMoves.add(emptyTileIndex + 1);

    return possibleMoves;
  }

  void _swapTiles(int index, bool updateHistory) {
    setState(() {
      Tile temp = tiles[index];
      tiles[index] = tiles[emptyTileIndex];
      tiles[emptyTileIndex] = temp;
      emptyTileIndex = index;
      moveCount++;
      if (updateHistory) {
        history.add(List.from(tiles));
      }
    });
  }

  void _moveTile(int index) {
    if (_getPossibleMoves().contains(index)) {
      _swapTiles(index, true);
      _checkIfSolved();
    }
  }

  void _checkIfSolved() {
    bool solved = true;
    for (int i = 0; i < tiles.length - 1; i++) {
      if (tiles[i].number != i + 1) {
        solved = false;
        break;
      }
    }
    if (solved) {
      setState(() {
        isSolved = true;
      });
      _showWinAnimation();
    }
  }

  void _showWinAnimation() {
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isSolved = true;
      });
    });
  }

  void _undoLastMove() {
    if (history.length > 1) {
      setState(() {
        history.removeLast();
        tiles = List.from(history.last);
        emptyTileIndex = tiles.indexWhere((tile) => tile.isEmpty);
        moveCount--;
      });
    }
  }

  void _increaseGridSize() {
    if (gridSize < 6) {
      setState(() {
        gridSize++;
        _generateTiles();
      });
    }
  }

  void _decreaseGridSize() {
    if (gridSize > 2) {
      setState(() {
        gridSize--;
        _generateTiles();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu de Taquin'),
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
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: isSolved && index != emptyTileIndex
                          ? Colors.green.withOpacity(0.5)
                          : null,
                      border: isSolved && index != emptyTileIndex
                          ? Border.all(color: Colors.green, width: 3)
                          : null,
                    ),
                    child: TileWidget(tile: tiles[index], gridSize: gridSize),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Déplacements: $moveCount'),
                if (isSolved)
                  Text('Félicitations, vous avez gagné !',
                      style: TextStyle(color: Colors.green, fontSize: 18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _shuffleTiles(20),
                      child: Text('Mélanger'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _undoLastMove,
                      child: Text('Annuler'),
                    ),
                  ],
                ),
                Text('Taille du plateau: $gridSize x $gridSize'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: _decreaseGridSize,
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _increaseGridSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tile {
  String imageURL;
  Alignment alignment;
  int number;
  bool isEmpty;

  Tile(
      {required this.imageURL,
      required this.alignment,
      this.number = 0,
      this.isEmpty = false});

  Tile.empty() : this(imageURL: '', alignment: Alignment(0, 0), isEmpty: true);

  Widget croppedImageTile(int gridSize) {
    if (isEmpty) {
      return Container(color: Colors.grey[300]);
    }
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: alignment,
            widthFactor: 1 / gridSize,
            heightFactor: 1 / gridSize,
            child: Image.network(imageURL, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final Tile tile;
  final int gridSize;

  TileWidget({required this.tile, required this.gridSize});

  @override
  Widget build(BuildContext context) {
    return tile.isEmpty
        ? Container(color: Colors.grey[300])
        : tile.croppedImageTile(gridSize);
  }
}
