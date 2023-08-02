import 'package:dio/dio.dart';

import '../service/dioService.dart';
import '../model/serviceModel.dart';

class ServiceRepository {
  final DioService _dioService = DioService();

  Future<List<ServiceModel>> getServices() async {
    try {
      final Response response = await _dioService.get('/services');

      final services =
          (response.data as List).map((e) => ServiceModel.fromJson(e)).toList();

      return services;
    } catch (err) {
      print(err);

      throw 'error api';
    }
  }
}
