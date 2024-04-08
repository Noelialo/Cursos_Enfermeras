
// ignore: file_names
import 'package:flutter/material.dart';

import 'main_drawer.dart';

import 'createcourse.dart';
import 'viewcourse.dart';
import 'createusers.dart';
import 'viewusers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeAdmin(),
    );
  }
}

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),

      ),
      drawer: const MainDrawer(), // Utiliza el drawer personalizado aquí
      body: Column(
        children: [
          // Primera fila con dos imágenes
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateCourse()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: Image.asset('assets/create_course.png')), // Imagen ajustada
                        const Text('Crear Cursos')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCourse()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: Image.asset('assets/view_course.png')), // Imagen ajustada
                        Text('Ver Cursos')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Segunda fila con dos imágenes
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateUsers()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: Image.asset('assets/create_user.png')), // Imagen ajustada
                        const Text('Crear Usuario/Alumno')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewUsers()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: Image.asset('assets/view_students.png')), // Imagen ajustada
                        const Text('Ver Alumnos')
                      ],
                    ),
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
