import 'package:dio/dio.dart';

import '../service/dioService.dart';
import '../model/serviceCollaborator.dart';

class ServiceCollaboratorRepository {
  final DioService _dioService = DioService();

  Future<List<ServiceCollaboratorModel>> getServiceCollaborator(
      int idService) async {
    try {
      final Response response =
          await _dioService.get('/serviceCollaborator/$idService');

      final responseList = (response.data as List)
          .map((e) => ServiceCollaboratorModel.fromJson(e))
          .toList();

      return responseList;
    } catch (err) {
      print(err);

      throw 'error api';
    }
  }
}
