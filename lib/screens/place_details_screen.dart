import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  PlaceDetailsScreen({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Location: ',
              style: TextTheme.of(
                context,
              ).bodyLarge!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
