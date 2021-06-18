import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<RandomGenerator>(
        create: (_) => RandomGenerator(),
        child: MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.teal.shade900,
            appBar: AppBar(
              title: Text('Magic 8 Ball'),
              backgroundColor: Colors.teal,
            ),
            body: MagicBall(),
          ),
        ),
      ),
    );

class MagicBall extends StatelessWidget {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<RandomGenerator>(builder: (context, random, child) {
      return Center(
        child: TextButton(
          child: Image.asset('images/ball${random.ballNumber}.png'),
          onPressed: () {
            random.randomNumber();
          },
        ),
      );
    });
  }
}

class RandomGenerator extends ChangeNotifier {
  int ballNumber = 1;

  void randomNumber() {
    ballNumber = Random().nextInt(5) + 1;
    notifyListeners();
  }
}
