import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Loading...'),
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
