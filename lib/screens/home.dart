import 'package:flutter/material.dart';
import 'package:golden_razor/repository/userRepository.dart';

import '../components/base_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      activeDrawer: true,
      title: 'Golden Razor',
      child: Column(
        children: <Widget>[
          Center(
            child: Text('Você ainda nâo fez nenhuma reserva.'),
          ),
        ],
      ),
    );
  }
}
