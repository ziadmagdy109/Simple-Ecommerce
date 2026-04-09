import 'package:flutter/material.dart';

class WidgetOfflineNetwork extends StatelessWidget {
  const WidgetOfflineNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Can/'t connect .. check internet",
              style: TextStyle(fontSize: 22, color: Colors.grey),
            ),
            Image.asset("assets/images/No_Signal.png"),
          ],
        ),
      ),
    );
  }
}
