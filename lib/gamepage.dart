import 'package:flutter/material.dart';


// ignore: must_be_immutable
class GamePage extends StatelessWidget {
  List<dynamic> results;
  GamePage(this.results);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.blue[50],
              child: Center(child: Text('${results[index]['detectedClass']}' + '\n')),
            );
          }
      ),
    );
  }
}
