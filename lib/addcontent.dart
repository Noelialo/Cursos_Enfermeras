import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'main_drawer.dart';

class AddContent extends StatefulWidget {
  const AddContent({super.key});

  @override
  _AddContentState createState() => _AddContentState();
}

class _AddContentState extends State<AddContent> {
  String? _pickedFile;
  FileType _fileType = FileType.custom;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: _fileType,
      allowedExtensions: _fileType == FileType.custom ? ['pdf', 'mp4', 'mov', 'avi', 'mkv'] : [],
    );

    if (result != null) {
      setState(() {
        _pickedFile = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Contenido a Módulos'),
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButton<FileType>(
              value: _fileType,
              onChanged: (FileType? newValue) {
                setState(() {
                  _fileType = newValue!;
                  _pickedFile = null; // Reset the picked file
                });
              },
              items: <DropdownMenuItem<FileType>>[
                const DropdownMenuItem(
                  value: FileType.custom,
                  child: Text('PDF'),
                ),
                const DropdownMenuItem(
                  value: FileType.video,
                  child: Text('Video'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text(_pickedFile == null ? 'Seleccionar Archivo' : 'Cambiar Archivo'),
            ),
            if (_pickedFile != null) Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Archivo seleccionado: $_pickedFile'),
            ),
            // ...otros campos y botones
          ],
        ),
      ),
    );
  }
}
