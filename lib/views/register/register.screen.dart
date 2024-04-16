import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth.viewmodel.dart';

import '../../widgets/elevated_button.widget.dart';
import '../../widgets/text_field.widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (Provider.of<AuthViewModel>(context).isAuthenticated) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/home'));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _usernameController,
              labelText: 'Nombre de usuario',
            ),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Contraseña',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              text: 'Registrarse',
              onPressed: () {
                // Implementar la lógica de registro
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
