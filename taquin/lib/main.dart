import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageTransformPage(),
    );
  }
}

class ImageTransformPage extends StatefulWidget {
  @override
  _ImageTransformPageState createState() => _ImageTransformPageState();
}

class _ImageTransformPageState extends State<ImageTransformPage> {
  double _rotationZ = 0.0;
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _scale = 1.0;
  bool _isMirrored = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transformations d'Image")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateX(_rotationX)
              ..rotateY(_rotationY)
              ..rotateZ(_rotationZ)
              ..scale(_isMirrored ? -_scale : _scale, _scale),
            child: Image.network(
              'https://picsum.photos/300/300',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text("Rotation Z"),
          Slider(
            value: _rotationZ,
            min: -pi,
            max: pi,
            onChanged: (value) {
              setState(() {
                _rotationZ = value;
              });
            },
          ),
          Text("Rotation X"),
          Slider(
            value: _rotationX,
            min: -pi,
            max: pi,
            onChanged: (value) {
              setState(() {
                _rotationX = value;
              });
            },
          ),
          Text("Rotation Y"),
          Slider(
            value: _rotationY,
            min: -pi,
            max: pi,
            onChanged: (value) {
              setState(() {
                _rotationY = value;
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
