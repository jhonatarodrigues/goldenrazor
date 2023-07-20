import 'package:flutter/material.dart';
import 'package:golden_razor/routes/app_routes.dart';

import '../components/base_screen.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({
    super.key,
  });

  Widget _boxService(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.scheduleService);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: const Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cabelo e barba',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'R\$ 50,00',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Tempo médio: 25min',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Agendamento',
      child: Column(
        children: [
          const Text('Escolha o serviço que deseja'),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
          ),
          _boxService(context),
          _boxService(context),
          _boxService(context),
          _boxService(context),
        ],
      ),
    );
  }
}
