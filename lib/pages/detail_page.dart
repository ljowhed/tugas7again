import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;

  const DetailPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
