import 'package:dio/dio.dart';
import 'dart:convert';

import '../service/dioService.dart';
import '../model/userModel.dart';

class LoginRepository {
  final DioService _dioService = DioService();

  Future<UserModel> login(String email, String password) async {
    try {
      final Response response =
          await _dioService.get('/login?email=$email&password=$password');

      return UserModel.fromJson(response.toString());
    } catch (err) {
      print(err);

      throw 'error api';
    }
  }
}
