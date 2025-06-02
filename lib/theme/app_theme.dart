import 'package:flutter/material.dart';

class AppTheme {
  // Colores
  static const Color green = Color(0xFF4CAF50);
  static const Color darkBlack = Color(0xFF121212);
  static const Color white = Color.fromARGB(255, 242, 241, 241);

  // Gradiente para fondo
  static LinearGradient backgroundGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [green, darkBlack],
  );

  // Texto
  static TextStyle buttonTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  //
  static TextStyle textTitle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w800,
    
  );

  // Botón elevado
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: AppTheme.green.withValues(alpha: 0.85), // fondo semitransparente verde
  foregroundColor: Colors.white, // texto blanco
  minimumSize: const Size(double.infinity, 60), // un poco más alto
  padding: const EdgeInsets.symmetric(horizontal: 20),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: BorderSide(color: AppTheme.green, width: 2), // borde verde claro
  ),
  elevation: 10,
  shadowColor: AppTheme.green.withValues(alpha: 0.8),
  textStyle: buttonTextStyle,
);

// Nuevo estilo para iconos de botón para color claro y tamaño
static const IconThemeData buttonIconTheme = IconThemeData(
  color: Colors.white70,
  size: 26,
);


  // AppBar oscuro
  static AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: darkBlack,
    centerTitle: true,
    titleTextStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
    elevation: 2,
  );

  // Tema general oscuro
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBlack,
    appBarTheme: appBarTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );


  // TextField Decoration
  static InputDecoration textFieldDecoration({
  required String hintText,
  required IconData icon,
}) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: Icon(icon, color: Colors.grey),
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: const EdgeInsets.symmetric(
      vertical: 18,
      horizontal: 12,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
}
