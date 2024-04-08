import 'package:flutter/material.dart';
import 'register.dart'; // Asegúrate de que esta línea está agregando correctamente tu archivo 'register.dart'
import 'homeadmin.dart'; // Nombre del archivo en snake_case

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isDesktop = constraints.maxWidth > 600;
          return isDesktop
              ? Row(
                  children: [
                    Expanded(
                      child: _buildSignInForm(context),
                    ),
                    Expanded(
                      child: Image.asset('assets/path_to_your_image.png'), // Asegúrate de que la ruta de la imagen es correcta
                    ),
                  ],
                )
              : _buildSignInForm(context);
        },
      ),
    );
  }

  Widget _buildSignInForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Iniciar sesión en tu cuenta',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              child: const Text('Login/Inicio'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeAdmin()), // Corrección aquí
                );
              },
            ),
            TextButton(
              child: const Text('¿Olvidaste Clave?'),
              onPressed: () {
                // Aquí iría la lógica para recuperar la contraseña
              },
            ),
            TextButton(
              child: const Text('No tienes una cuenta aun? Regístrese aqui.'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()), // Asegúrate de que 'RegisterScreen' es la clase correcta en 'register.dart'
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// La clase HomeAdmin debe ser definida en home_admin.dart.
// Asegúrate de que está definida y exportada correctamente.
