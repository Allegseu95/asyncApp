import 'package:flutter/material.dart';
import '../widgets/element.dart';

class Home extends StatelessWidget {
  Home({super.key});

  ElementBtn button1 = const ElementBtn(1);
  ElementBtn button2 = const ElementBtn(2);
  ElementBtn button3 = const ElementBtn(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Alex Santacruz - 8A'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button1,
            button2,
            button3,
          ],
        ));
  }
}
