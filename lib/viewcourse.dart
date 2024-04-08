import 'package:flutter/material.dart';
import 'main_drawer.dart'; // Importa el MainDrawer aquí

class ViewCourse extends StatelessWidget {
  const ViewCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Cursos'), // Título de la AppBar
      ),
      drawer: const MainDrawer(), // Añade el MainDrawer aquí
      body: ListView.builder(
        itemCount: 10, // El número de cursos que quieres mostrar
        itemBuilder: (context, index) {
          // Aquí construirías el widget que representa cada curso
          return ListTile(
            title: Text('Curso #$index'), // El título del curso
            subtitle: Text('Descripción del Curso #$index'), // Una descripción o cualquier otro detalle
            // Puedes agregar más información o acciones, como editar o eliminar
          );
        },
      ),
    );
  }
}
