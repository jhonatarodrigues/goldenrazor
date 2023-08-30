import 'package:flutter/material.dart';
import 'package:golden_razor/model/storage_item.dart';
import 'package:golden_razor/model/userModel.dart';
import 'package:golden_razor/repository/loginRepository.dart';
import 'package:golden_razor/routes/app_routes.dart';
import 'package:golden_razor/service/storageService.dart';

import '../components/base_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final LoginRepository _loginRepository = LoginRepository();
  final StorageService _storageService = StorageService();

  // final response = await _user.getUser();

  // void testeGet() async {
  //   final response = await _user.getUser();

  //   print(response);
  // }

  Future login() async {
    if (passwordController.text == '' || emailController.text == '') {
      print('adicione email e senha');
      return;
    }

    UserModel response = await _loginRepository.login(
        emailController.text, passwordController.text);

    await _storageService
        .writeSecureData(StorageItem('user', response.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backButton: false,
      activeDrawer: false,
      title: 'Golden Razor',
      child: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {
                    login();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.register);
                  },
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
