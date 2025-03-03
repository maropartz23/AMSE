import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;
  int gridSize;

  Tile(
      {required this.imageURL,
      required this.alignment,
      required this.gridSize});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / gridSize,
            heightFactor: 1 / gridSize,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

class Exo5 extends StatefulWidget {
  @override
  _Exo5State createState() => _Exo5State();
}

class _Exo5State extends State<Exo5> {
  int gridSize = 3;
  String imageURL = 'https://picsum.photos/512';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exo 5: Plateau de Tuiles'),
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
              itemCount: gridSize * gridSize,
              itemBuilder: (context, index) {
                double x = -1.0 + (index % gridSize) * (2.0 / (gridSize - 1));
                double y = -1.0 + (index ~/ gridSize) * (2.0 / (gridSize - 1));
                Tile tile = Tile(
                    imageURL: imageURL,
                    alignment: Alignment(x, y),
                    gridSize: gridSize);
                return Container(
                  margin: EdgeInsets.all(2.0),
                  child: tile.croppedImageTile(),
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
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
