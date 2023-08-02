import 'package:flutter/material.dart';
import 'package:golden_razor/model/userModel.dart';

import '../components/base_screen.dart';
import '../repository/userRepository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final UserRepository _userRepository = UserRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future newRegister() async {
    if (passwordController.text != confirmPasswordController.text) {
      print('error password');
      return;
    }

    UserModel response = await _userRepository.addUser(
      nameController.text,
      emailController.text,
      phoneController.text,
      passwordController.text,
    );

    print('----------');
    print(response.id);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      activeDrawer: false,
      title: 'Cadastre-se',
      child: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirme sua senha',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    controller: cpfController,
                    decoration: const InputDecoration(
                      labelText: 'CPF',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
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
                    newRegister();
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
