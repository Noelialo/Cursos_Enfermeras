import 'package:flutter/material.dart';
import 'main_drawer.dart'; // Asegúrate de que este archivo existe y está en la ubicación correcta
import 'createmodules.dart';

class CreateCourse extends StatefulWidget {
  const CreateCourse({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _finishDateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _startDateController.dispose();
    _finishDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Curso'),
      ),
      drawer: const MainDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del curso',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del curso';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
                maxLines: 3,
              ),
              TextFormField(
                controller: _startDateController,
                decoration: const InputDecoration(
                  labelText: 'Fecha de inicio',
                ),
                onTap: () => _selectDate(context, _startDateController),
                readOnly: true, // Prevenir la entrada directa
              ),
              TextFormField(
                controller: _finishDateController,
                decoration: const InputDecoration(
                  labelText: 'Fecha de finalización',
                ),
                onTap: () => _selectDate(context, _finishDateController),
                readOnly: true, // Prevenir la entrada directa
              ),
              // ... otros campos del formulario
              ElevatedButton(
                onPressed: () {
                  // Procesar el formulario
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, muestra un snackbar o realiza alguna acción
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Procesando información')),
                    );
                  }
                },
                child: const Text('Crear Curso'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateModules()));
                },
                child: const Text('Insertar módulo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
