import 'package:flutter/material.dart';

class DealerSection extends StatelessWidget {
  const DealerSection({super.key});

  static String get routeName => 'dealerSection';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [Text('Dealer Section')],
      ),
    );
  }
}
