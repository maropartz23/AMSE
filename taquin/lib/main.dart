import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageTransformPage(),
    );
  }
}

class ImageTransformPage extends StatefulWidget {
  @override
  _ImageTransformPageState createState() => _ImageTransformPageState();
}

class _ImageTransformPageState extends State<ImageTransformPage> {
  double _rotation = 0.0;
  double _scale = 1.0;
  double _perspective = 0.0;
  bool _isMirrored = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transformations d'Image")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, _perspective) // Perspective 3D
                  ..rotateY(_isMirrored ? pi : 0) // Effet miroir
                  ..rotateZ(_rotation),
                child: Transform.scale(
                  scale: _scale,
                  child: Image.network(
                    'https://picsum.photos/512/1024',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Text("Rotation"),
          Slider(
            value: _rotation,
            min: -pi,
            max: pi,
            onChanged: (value) {
              setState(() {
                _rotation = value;
              });
            },
          ),
          Text("Taille"),
          Slider(
            value: _scale,
            min: 0.5,
            max: 2.0,
            onChanged: (value) {
              setState(() {
                _scale = value;
              });
            },
          ),
          Text("perspective"),
          Slider(
            value: _perspective,
            min: -1,
            max: 1,
            onChanged: (value) {
              setState(() {
                _perspective = value;
              });
            },
          ),
          SwitchListTile(
            title: Text("Effet miroir"),
            value: _isMirrored,
            onChanged: (value) {
              setState(() {
                _isMirrored = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
