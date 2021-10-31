import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/controllers/test_controller.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final controller = TestController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ElevatedButton(
          child: const Text("Text"),
          onPressed: () {
            controller.getData();
          },
        ),
      ),
    );
  }
}
