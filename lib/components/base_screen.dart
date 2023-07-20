import 'package:flutter/material.dart';
import './side_drawer.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final bool activeDrawer;

  const BaseScreen({
    super.key,
    required this.title,
    required this.child,
    this.activeDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: activeDrawer ? const SideDrawer() : null,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
