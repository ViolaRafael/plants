import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class PlantPage extends StatefulWidget {


  const PlantPage({Key? key}) : super(key: key);

  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack (
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 150,
              color: Colors.lightGreen,
            ),
          ),
          ClipPath(
            clipper: WaveClipperOne(flip: true),
            child: Container(
              height: 140,
              color: Colors.green,
              child: const Center(
                  child: Text(
                    "Platinha de alta qualidade",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
              ),
            ),
          ),

        ],
      ),
    );
  }
}