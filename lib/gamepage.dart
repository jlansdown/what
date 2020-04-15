import 'package:flutter/material.dart';
import 'dart:math';


// ignore: must_be_immutable
class GamePage extends StatefulWidget {
  List<dynamic> results;
  GamePage(this.results);


  @override
  _GamePageState createState() => new _GamePageState();
}


class _GamePageState extends State<GamePage> {
  int randomNumber;
  String playerGuess = "";

  var randomNumberGenerator = new Random();

  @override
  void initState() {
    super.initState();
  }

  void _setText(newText) {
    setState(() {
      playerGuess = newText;
    });
  }

  void _setRandomNumber(sizeOfResults) {
    randomNumber = randomNumberGenerator.nextInt(sizeOfResults);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Column(

          children: <Widget> [

            Text('$playerGuess'),

            Text('Bottom'),

            Expanded(

              child: ListView.builder(
                itemCount: widget.results.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${widget.results[index]['detectedClass']}'),
                    onTap: () {
                        _setRandomNumber(widget.results.length);
                        _setText(
                            '${widget.results[index]['detectedClass']}'
                                + ' ' + '${widget.results[randomNumber]['detectedClass']}');
                    },
                  ); 
                }
            ),

            ),
            Text('Bottom'),
      ],
      ),
    );
  }
}
