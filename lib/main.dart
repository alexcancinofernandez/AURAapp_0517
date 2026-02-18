import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  const WorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Fondo negro absoluto
        fontFamily: 'Roboto', // Fuente limpia estándar
      ),
      home: const ResultScreen(),
    );
  }
}

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // MainAxisAlignment.spaceBetween ayuda a distribuir el espacio disponible
            // de forma inteligente si sobra espacio.
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // --- 1. HEADER (Título y Basuca) ---
              Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Text(
                      "¡Bien hecho!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26, // Reduje ligeramente la fuente (28->26)
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Transform.rotate(
                      angle: -0.5,
                      child: const Icon(
                        Icons.celebration_rounded,
                        color: Colors.white,
                        size: 28, // Icono un pelín más pequeño
                      ),
                    ),
                  ),
                ],
              ),

              // Espacio reducido
              const Center(
                child: Text(
                  "este es tu entrenamiento N.188",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),

              // --- 2. MEDALLA ---
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.workspace_premium,
                      color: Color(0xFFFFD700),
                      size: 90, // Reducido de 100 a 90 para ganar espacio
                    ),
                    Positioned(
                      top: 22,
                      child: const Text(
                        "PR",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // --- 3. PESO ---
              const Center(
                child: Text(
                  "784 kg",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42, // Reducido de 48 a 42
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1.5,
                  ),
                ),
              ),

              // --- 4. TEXTOS DEL EJERCICIO ---
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Jalon al pecho\n(maquina)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28, // Reducido de 32 a 28
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 5), // Espacio mínimo
                  Text(
                    "mejor serie de volumen",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),

              // --- 5. AURA + USUARIO ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.change_history,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "AURA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "@empera",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),

              // --- 6. PUNTOS ---
              Row(
                children: [
                  _buildDot(isActive: true),
                  _buildDot(isActive: false),
                  _buildDot(isActive: false),
                  _buildDot(isActive: false),
                ],
              ),

              // --- 7. SECCIÓN COMPARTIR ---
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "compartir rutina",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10), // Espacio ajustado
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _socialButton(
                        FontAwesomeIcons.facebookF,
                        const Color(0xFF1877F2),
                      ),
                      _socialButton(
                        FontAwesomeIcons.instagram,
                        const Color(0xFFE1306C),
                      ),
                      _socialButton(
                        FontAwesomeIcons.whatsapp,
                        const Color(0xFF25D366),
                      ),
                      _socialButton(FontAwesomeIcons.xTwitter, Colors.white),
                      _socialButton(
                        FontAwesomeIcons.tiktok,
                        const Color(0xFF00F2EA),
                      ),
                    ],
                  ),
                ],
              ),

              // --- 8. BOTÓN OK (MÁS PEQUEÑO) ---
              SizedBox(
                width: double.infinity,
                height: 45, // <--- AQUÍ ESTÁ EL CAMBIO: de 55 bajamos a 45
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation:
                        0, // Quitamos sombra para que se vea más plano y limpio
                  ),
                  child: const Text(
                    "ok",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widgets auxiliares (sin cambios, solo se usan arriba)
  Widget _buildDot({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 10, // Un poco más pequeños (12->10)
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white24,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _socialButton(IconData icon, Color color) {
    // Ajustamos el tamaño del cuadro para pantallas pequeñas
    // Usamos Flexible o un tamaño fijo un poco menor si es necesario,
    // pero 48x48 suele estar bien.
    return Container(
      width: 45, // Reducido de 50 a 45
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white10,
      ),
      child: Center(
        child: FaIcon(
          icon,
          color: color,
          size: 20, // Icono interno ajustado
        ),
      ),
    );
  }
}
