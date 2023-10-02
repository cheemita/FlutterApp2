import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/login_form_provider.dart';
import 'package:flutter_application_2/ui/input_decorations.dart';
import 'package:flutter_application_2/widgets/auth_background.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 250,
        ),
        CardContainer(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text("Login", style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(
                height: 20,
              ),
              _loginForm(),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Sign in or create a new account",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ]),
    )));
  }

  Widget _loginForm() {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              controller: _usernameController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: "",
                  labelText: "Username",
                  prefixIcon: Icons.email)),
          TextField(
            controller: _passwordController,
            decoration: InputDecorations.authInputDecoration(
                hintText: "",
                labelText: "Password",
                prefixIcon: Icons.lock_open),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                  onPressed: onLogin, child: const Text('Login')))
        ],
      ),
    );
  }

  void onLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    print('username: $username');
    print('password: $password');
  }
}
