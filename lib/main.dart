import 'package:flutter/material.dart';

void main() {
  runApp(const MelligyApp());
}

class MelligyApp extends StatelessWidget {
  const MelligyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0E0E0E), // خلفية سوداء
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'فلوس المليجي',
                style: TextStyle(
                  color: Color(0xFFD4AF37), // لون ذهبي
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'للتجارة والتوريدات',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                child: const Text('أهلاً بك'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
