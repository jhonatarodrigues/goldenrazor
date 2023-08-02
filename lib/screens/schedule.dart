import 'package:flutter/material.dart';
import 'package:golden_razor/model/serviceModel.dart';
import 'package:golden_razor/repository/serviceRepository.dart';
import 'package:golden_razor/routes/app_routes.dart';

import '../components/base_screen.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({
    super.key,
  });

  final ServiceRepository _serviceRepository = ServiceRepository();
  final List<ServiceModel> list = [
    ServiceModel(
        id: 6,
        title: 'title',
        price: 5,
        averageTime: 'averageTime',
        status: false),
    ServiceModel(
        id: 7,
        title: 'title 2222',
        price: 5,
        averageTime: 'averageTime',
        status: false)
  ];

  Widget _boxService(BuildContext context, ServiceModel service) {
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
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'R\$ ${service.price}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    service.averageTime,
                    style: const TextStyle(fontSize: 12),
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
          Expanded(
            child: FutureBuilder<List<ServiceModel>>(
              future: _serviceRepository.getServices(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  final error = snapshot.error;
                  return Center(
                    child: Text(
                      "Error: " + error.toString(),
                    ),
                  );
                } else if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No data'),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final service = snapshot.data![index];

                      print(service.title);

                      return _boxService(context, service);
                    },
                  );
                }

                final error = snapshot.error;
                return Center(
                  child: Text(
                    "Error: " + error.toString(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
