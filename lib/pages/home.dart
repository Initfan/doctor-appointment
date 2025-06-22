import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Home Page')],
      ),
    );
  }
}
