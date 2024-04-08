import 'package:flutter/material.dart';

import 'homeadmin.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 1, 13, 23),
            ),
            child: Text('Menú', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop(); // Cerrar el drawer
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeAdmin()),
                (Route<dynamic> route) => false,
              );
            },

          ),
          // Añade aquí más `ListTile` para navegación
          // ...
        ],
      ),
    );
  }
}
