import 'package:flutter/material.dart';
import 'main_drawer.dart'; // Importa MainDrawer

class ViewUsers extends StatelessWidget {
  const ViewUsers({super.key});

  @override
  Widget build(BuildContext context) {
    // Aquí obtendrías los datos de tus usuarios, posiblemente de un ViewModel o directamente de un servicio
    final List<Map<String, dynamic>> users = List.generate(
      10,
      (index) => {
        'name': 'Usuario $index',
        'email': 'usuario$index@ejemplo.com',
        // Añade aquí más campos si los necesitas
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Usuarios'), // Título de la AppBar
      ),
      drawer: const MainDrawer(), // Añade el MainDrawer aquí
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Para hacer scroll si la tabla es muy ancha
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Correo electrónico')),
            // Define aquí más columnas si las necesitas
          ],
          rows: users.map((user) {
            return DataRow(cells: [
              DataCell(Text(user['name'])),
              DataCell(Text(user['email'])),
              // Añade aquí más celdas si tienes más campos
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
