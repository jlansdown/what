import 'package:flutter/material.dart';
import 'dart:math';
import 'resultspage.dart';
import'package:vibrate/vibrate.dart';


// ignore: must_be_immutable
class GamePage extends StatelessWidget {
  List<dynamic> results;
  GamePage(this.results);
  String resultImage = "";

  var randomNumberGenerator = new Random();


  @override
  Widget build(BuildContext context) {

    final int randomResultsIndex = randomNumberGenerator.nextInt(results.length);

    return Scaffold(
      appBar: AppBar(
        title: Text("Guess What?!"),
      ),

      body: Padding(

      padding: EdgeInsets.only(top: 150),


        child: Column(


          children: <Widget> [

            Text("Guess what the computer chose!!"),

            Image.asset('assets/what.png'),

            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return ListTile (
                    title: Text('${results[index]['detectedClass']}'),
                    onTap: () {

                      results[index]['detectedClass'] == results[randomResultsIndex]['detectedClass'] ?
                      resultImage = 'assets/correct.png' :  resultImage = 'assets/incorrect.png';

                      Vibrate.vibrate();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultsPage(resultImage)),
                      );

                    },
                  );
                }
              )

            )

          ],
        ),
      ),
    );
  }
}
