import 'package:dio/dio.dart';
import 'dart:convert';

import '../service/dioService.dart';
import '../model/userModel.dart';

class UserRepository {
  final DioService _dioService = DioService();

  Future<List<UserModel>> getUser() async {
    try {
      Response response;
      response = await _dioService.get('/user/1');

      final users = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();

      print(response);
      print(users.toString());

      return users;
    } catch (err) {
      print(err);

      throw 'error api';
    }
  }

  Future<UserModel> addUser(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    try {
      final Response response = await _dioService.post(
        '/user',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        },
      );

      return UserModel.fromJson(response.toString());
    } catch (e) {
      rethrow;
    }
  }
}
