import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLogin = true;

  Future<void> _authenticate() async {
    try {
      if (_isLogin) {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Ошибка: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Фон - глубокий градиент
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade900, Colors.teal.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Светящиеся "ауры"
          Positioned(
            top: -80,
            left: -40,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.indigo.withOpacity(0.25), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -60,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.purpleAccent.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Лёгкие "звёздочки"
          Positioned(
            top: 120,
            left: 40,
            child: Icon(
              Icons.circle,
              size: 6,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          Positioned(
            top: 200,
            right: 70,
            child: Icon(
              Icons.circle,
              size: 4,
              color: Colors.cyanAccent.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 180,
            left: 90,
            child: Icon(
              Icons.circle,
              size: 5,
              color: Colors.purpleAccent.withOpacity(0.4),
            ),
          ),

          // Основной контент
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Заголовок
                  Text(
                    "NEXUS",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [
                            Colors.tealAccent.shade100,
                            Colors.purpleAccent.shade100,
                          ],
                        ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                      shadows: [
                        Shadow(
                          blurRadius: 12,
                          color: Colors.black.withOpacity(0.6),
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Email
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.25),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.25),
                      hintText: "Пароль",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Кнопка Вход/Регистрация
                  ElevatedButton(
                    onPressed: _authenticate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent.shade400,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 8,
                      shadowColor: Colors.tealAccent,
                    ),
                    child: Text(
                      _isLogin ? "Войти" : "Регистрация",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Переключатель режимов
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin
                          ? "Нет аккаунта? Зарегистрироваться"
                          : "Уже есть аккаунт? Войти",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
