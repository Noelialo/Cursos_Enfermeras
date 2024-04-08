import 'package:colegio_enfermeras/addcontent.dart';
import 'package:flutter/material.dart';
import 'main_drawer.dart';

class CreateModules extends StatefulWidget {
  const CreateModules({super.key});

  @override
  _CreateModulesState createState() => _CreateModulesState();
}

class _CreateModulesState extends State<CreateModules> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  String? _selectedCourse; // Para guardar el curso seleccionado

  // Suponiendo que tienes una lista de cursos (esto podría venir de una base de datos)
  final List<String> _courses = ['Curso 1', 'Curso 2', 'Curso 3'];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _startDateController.dispose();
    super.dispose();
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _startDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Módulos'),
      ),
      drawer: const MainDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: _selectedCourse,
                decoration: const InputDecoration(
                  labelText: 'Selecciona Curso',
                ),
                items: _courses.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCourse = newValue!;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor seleccione un curso';
                  }
                  return null;
                },
              ),
                            TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del Módulo',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del módulo';
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
                  labelText: 'Fecha de Inicio',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectStartDate(context),
              ),
              // ... otros campos del formulario
              ElevatedButton(
                onPressed: () {
                  // Procesar el formulario
                  if (_formKey.currentState!.validate()) {
                    // Aquí procesarías la información del formulario
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Procesando información...')),
                    );
                  }
                },
                child: const Text('Crear Módulo'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddContent()));
                },
                child: const Text('Agregar el contenido'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
