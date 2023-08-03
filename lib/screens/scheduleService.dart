import 'package:flutter/material.dart';
import 'package:golden_razor/model/serviceCollaborator.dart';
import 'package:golden_razor/repository/serviceCollaboratorRepository.dart';

import './Arguments/ScheduleServiceScreenArguments.dart';
import '../routes/app_routes.dart';
import '../components/base_screen.dart';

class ScheduleServiceScreen extends StatelessWidget {
  ScheduleServiceScreen({
    super.key,
  });

  final ServiceCollaboratorRepository _serviceCollaboratorRepository =
      ServiceCollaboratorRepository();

  Widget _boxService(
      BuildContext context, ServiceCollaboratorModel serviceCollaborator) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.scheduleServiceDate);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  image: NetworkImage(serviceCollaborator.collaborator.picture),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceCollaborator.collaborator.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ScheduleServiceScreenArguments;

    return BaseScreen(
      title: 'Serviço de Agendamento',
      child: Column(
        children: [
          const Text('Escolha o profissional'),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
          ),
          Expanded(
            child: FutureBuilder<List<ServiceCollaboratorModel>>(
              future: _serviceCollaboratorRepository
                  .getServiceCollaborator(args.idService),
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
                      final data = snapshot.data![index];

                      return _boxService(context, data);
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
