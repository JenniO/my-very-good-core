import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  static String get routeName => 'homeSection';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('main.catalogue'.tr()),
        ],
      ),
    );
  }
}
