import 'package:flutter/material.dart';

class HowTo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("How To Play"),
        ),


      body: Padding(

        padding: EdgeInsets.only(top: 150, left: 50, right: 50),

        child: Center(

          child: Column(

            children: <Widget>[

              Text("What introduces the functionality of object" +
                  " detection and classification visually and uses it to play a" +
                  " game. \n\nThe computer will randomly pick a detected object and" +
                  " a user can try and guess what it chose. \n\nThe toggle switch can be" +
                  " enabled to visually show which objects are being detected with a" +
                  " confidence probability that the object is correct.",
                  style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Image.asset('assets/what.png'),

              RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Back"),
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