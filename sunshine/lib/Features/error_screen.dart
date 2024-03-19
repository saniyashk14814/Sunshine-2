import 'package:sunshine/Core/widgets.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/error.png',
            ),
            const Text(
              'Error',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'An error occurred while initializing the app.',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 87, 87, 87),
              ),
            ),
            const SizedBox(height: 130),
            ButtonWidget(
                text: 'Try Again',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
