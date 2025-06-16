import 'package:flutter/material.dart';

class NoWeatherData extends StatelessWidget {
  const NoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'There is no weather 😔 start searching now 🔍',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}