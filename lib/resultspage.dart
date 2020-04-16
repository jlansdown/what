import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what/home.dart';

class ResultsPage extends StatelessWidget {

  String resultImage;
  ResultsPage(this.resultImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Results"),
      ),

        body: Padding(

        padding: EdgeInsets.only(top: 150),

        child: Center(

          child: Column(

          children: <Widget>[

            Text("Your guess was...",
                style: TextStyle(fontWeight: FontWeight.bold)),

            Image.asset(resultImage),

            RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Play again!",
                  style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            ),
          ],

        ),
        ),
        ),
    );
  }

}