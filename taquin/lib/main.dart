import 'package:flutter/material.dart';

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
  double _rotation = 0.0;
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sliders")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: _rotation,
            child: Transform.scale(
              scale: _scale,
              child: Image.network(
                'https://picsum.photos/300/300',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("Rotation"),
          Slider(
            value: _rotation,
            min: 0.0,
            max: 6.28,
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
        ],
      ),
    );
  }
}
