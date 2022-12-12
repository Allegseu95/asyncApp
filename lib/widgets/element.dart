import 'package:flutter/material.dart';
import '../services/mockapi.dart';

class ElementBtn extends StatefulWidget {
  const ElementBtn(this.btn, {super.key});

  final int btn;
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => ElementAnimation(btn);
}

class ElementAnimation extends State<ElementBtn> {
  ElementAnimation(
    this.btn,
  );

  int duration = 0;
  int title = 0;
  double size = 0;

  final MockApi mockApi = MockApi();
  final int btn;

  void getDuration() async {
    setState(() {
      duration = btn == 1
          ? 1
          : btn == 2
              ? 3
              : 10;
      size = 150.0;
    });

    var result = btn == 1
        ? await mockApi.getFerrariInteger()
        : btn == 2
            ? await mockApi.getHyundaiInteger()
            : btn == 3
                ? await mockApi.getFisherPriceInteger()
                : 0;

    setState(() {
      duration = 0;
      title = result;
      size = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: btn == 1
              ? Colors.green
              : btn == 2
                  ? Colors.orange
                  : Colors.red,
          foregroundColor: Colors.black,
          onPressed: () {
            getDuration();
          },
          child: btn == 1
              ? const Icon(Icons.flash_on)
              : btn == 2
                  ? const Icon(Icons.airport_shuttle)
                  : const Icon(Icons.directions_run),
        ),
        const Divider(
          height: 10,
          color: Colors.transparent,
        ),
        AnimatedContainer(
          width: size,
          height: 20,
          color: btn == 1
              ? Colors.green
              : btn == 2
                  ? Colors.orange
                  : Colors.red,
          duration: Duration(seconds: duration),
          curve: Curves.fastOutSlowIn,
        ),
        const Divider(
          height: 1,
          color: Colors.transparent,
        ),
        Text(title.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: btn == 1
                  ? Colors.green
                  : btn == 2
                      ? Colors.orange
                      : Colors.red,
            )),
      ],
    ));
  }
}
