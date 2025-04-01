import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CollectionStatsScreen extends StatefulWidget {
  @override
  _CollectionStatsScreenState createState() => _CollectionStatsScreenState();
}

class _CollectionStatsScreenState extends State<CollectionStatsScreen> {
  File? _restaurantImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _lastCollectionController =
      TextEditingController();
  final TextEditingController _averageController = TextEditingController();
  final TextEditingController _nextDateController = TextEditingController();

  Future<void> _takePhoto() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (photo != null) {
        setState(() {
          _restaurantImage = File(photo.path);
        });
      }
    } catch (e) {
      print("Error al tomar foto: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al acceder a la cámara')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Estadísticas de Recolección',
          style: TextStyle(fontFamily: 'Roboto', color: Color(0xFF5E5343)),
        ),
        backgroundColor: Color(0xFFD8C4B6),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFEAE4DB),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          // Permite desplazamiento
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Sección para foto del restaurante
              GestureDetector(
                onTap: _takePhoto,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFB8A99A), width: 1),
                  ),
                  child:
                      _restaurantImage != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _restaurantImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: Color(0xFF5E5343),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Añadir foto del restaurante',
                                style: TextStyle(color: Color(0xFF5E5343)),
                              ),
                            ],
                          ),
                ),
              ),

              SizedBox(height: 30),

              // Campo de descripción
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Descripción del restaurante',
                  labelStyle: TextStyle(color: Color(0xFF5E5343)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFB8A99A)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFFD8C4B6), width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                ),
              ),

              SizedBox(height: 30),

              // Tarjeta de estadísticas
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFB8A99A), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estadísticas de Recolección',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5E5343),
                      ),
                    ),

                    SizedBox(height: 20),

                    _buildStatField(
                      'Peso de última recolección hecha (Kg):',
                      _lastCollectionController,
                    ),
                    SizedBox(height: 15),
                    _buildStatField(
                      'Promedio mensual de recolección del último semestre (Kg):',
                      _averageController,
                    ),
                    SizedBox(height: 15),
                    _buildStatField(
                      'Próxima fecha de recolección:',
                      _nextDateController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Color(0xFF5E5343)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFFB8A99A)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
