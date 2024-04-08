import 'package:flutter/material.dart';
import 'main_drawer.dart'; // Asegúrate de importar el MainDrawer

class CreateUsers extends StatelessWidget {
  const CreateUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Usuarios'), // Asegúrate de que el título es correcto
      ),
      drawer: const MainDrawer(), // Incluir el MainDrawer aquí
      body: const Center(
        child: Text('Contenido de Crear Usuarios'), // Actualiza el texto para reflejar esta pantalla
      ),
    );
  }
}
