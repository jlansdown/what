import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'camera.dart';
import 'bndbox.dart';
import 'gamepage.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recognitions;
  bool showBoxes = false;
  String message = "";
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String res;
    switch (_model) {
      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/mobilenet_v1_1.0_224.tflite",
            labels: "assets/mobilenet_v1_1.0_224.txt");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  _onChanged(bool value) {
    setState(() {
      if (value) {
        message = "This is true";
        showBoxes = true;
        value = true;
      } else {
        message = "This is false";
        showBoxes = false;
        value = false;
      }
    });
  }

  playGame() {

  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: _model == ""
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: const Text(ssd),
                    onPressed: () => onSelect(ssd),
                  ),
                  RaisedButton(
                    child: const Text(mobilenet),
                    onPressed: () => onSelect(mobilenet),
                  ),
                ],
              ),
            )
          : Stack(
              children: [

                Camera(
                  widget.cameras,
                  _model,
                  setRecognitions,
                ),

                if(showBoxes) BndBox(
                    _recognitions == null ? [] : _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    _model
                ),

                Positioned (
                  bottom: 45,
                  right: 45,
                  width: 75,
                  child: new Switch(
                    value: showBoxes,
                    onChanged: (bool value) => _onChanged(value),
                    activeColor: Colors.green,
                  ),
                ),

                Positioned(
                  bottom: 45,
                  left: 45,
                  width: 100,
                  child: RaisedButton(
                    child: const Text("Play"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GamePage(_recognitions)),
                      );
                    }
                    ),
                ),
              ],
            ),
    );
  }
}
