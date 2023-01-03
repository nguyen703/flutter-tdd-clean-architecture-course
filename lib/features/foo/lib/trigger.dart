import 'package:clean_architecture_tdd_course/bridge.dart';
import 'package:flutter/material.dart';

class Trigger extends StatelessWidget {
  const Trigger({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final facade = NumberTriviaFacade.instance;

    return Center(
      child: TextButton(
          onPressed: () {
            facade.getRandomTrivia();
          },
          child: Text(S.of(context).trigger, style: TextStyle(fontSize: 20))),
    );
  }
}
