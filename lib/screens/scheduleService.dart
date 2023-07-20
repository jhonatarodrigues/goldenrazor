import 'package:flutter/material.dart';

import '../components/base_screen.dart';

class ScheduleServiceScreen extends StatelessWidget {
  const ScheduleServiceScreen({
    super.key,
  });

  Widget _boxService() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: const Image(
              width: 50,
              height: 50,
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nathan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Proxima agenda disponível: 12 ago',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Serviço de Agendamento',
      child: Column(
        children: [
          const Text('Escolha o serviço que deseja'),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
          ),
          _boxService(),
          _boxService(),
          _boxService(),
          _boxService(),
        ],
      ),
    );
  }
}
