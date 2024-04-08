import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: const RegisterForm(), // Aquí se añade el RegisterForm al cuerpo de tu Scaffold
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key}); // Agrega const para constructor

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _secondLastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  // Agrega aquí más controladores si necesitas más campos

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _secondLastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Aquí implementarías la lógica de registro
      print('Formulario válido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor introduce tu nombre';
                }
                return null;
              },
            ),

            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Primer Apellido'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor introduce tu apellido';
                }
                return null;
              },
            ),

            TextFormField(
              controller: _secondLastNameController,
              decoration: const InputDecoration(labelText: 'Segundo Apellido'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor introduce tu segundo apellido';
                }
                return null;
              },

            ),

            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Telefono'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor introduce tu numero de telefono';
                }
                return null;
              },
            ),

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor introduce tu correo electronico';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Contrasena'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor introduce tu Clave secreta';
                }
                return null;
              },
            ),

            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirma contrasena'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor confirma ti contrasena';
                }
                return null;
              },
            ),
            // Repite los TextFormField para cada controlador que tengas...
            ElevatedButton(
              onPressed: _register,
              child: const Text('Registrar'),
            ),
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de términos y condiciones o mostrarlos
              },
              child: const Text(
                'Al registrarse acepta los Términos y Condiciones y la política de privacidad',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
