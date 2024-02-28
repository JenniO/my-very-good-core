import 'package:flutter/material.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  static String get routeName => 'colorSection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [Text('Color Section')],
      ),
    );
  }
}
