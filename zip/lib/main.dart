import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Убедитесь, что этот файл существует после flutterfire configure
import 'screens/login_screen.dart'; // Импортируем наш LoginScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEXUS DATING',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true, // Опционально: используйте Material Design 3
      ),
      // Начинаем с LoginScreen
      home: const LoginScreen(),
    );
  }
}
