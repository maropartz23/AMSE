import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

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
  late Timer _timer;
  bool _isAnimating = false;

  void _startAnimation() {
    _isAnimating = true;
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        _rotationZ < pi - 0.06 ? _rotationZ += 0.05 : _rotationZ = -pi;
        _rotationX < pi - 0.04 ? _rotationX += 0.03 : _rotationX = -pi;
        _rotationY < pi - 0.03 ? _rotationY += 0.02 : _rotationY = -pi;
      });
    });
  }

  void _stopAnimation() {
    _isAnimating = false;
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          ElevatedButton(
            onPressed: _isAnimating ? _stopAnimation : _startAnimation,
            child: Text(
                _isAnimating ? "Arrêter l'animation" : "Démarrer l'animation"),
          ),
        ],
      ),
    );
  }
}
