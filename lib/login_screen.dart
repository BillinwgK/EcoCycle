import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';
import '../constants/colors.dart'; // Asegúrate de importar los colores

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Iniciar Sesión',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
            color: AppColors.text,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.button,
        elevation: 0,
      ),
      body: Container(
        color: AppColors.base,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo EcoCycle (reemplaza con tu asset)
                Image.asset(
                  'assets/images/logo_ecocycle.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 32),
                // Campo de Email
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    labelStyle: TextStyle(color: AppColors.text),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.button, width: 2),
                    ),
                    filled: true,
                    fillColor: AppColors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 16),
                // Campo de Contraseña
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: AppColors.text),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.button, width: 2),
                    ),
                    filled: true,
                    fillColor: AppColors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 32),
                // Botón de Iniciar Sesión
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    foregroundColor: AppColors.text,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Enlaces
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    '¿No tienes cuenta? Regístrate',
                    style: TextStyle(color: AppColors.text),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(color: AppColors.text),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
