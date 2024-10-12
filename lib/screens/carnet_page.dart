import 'package:flutter/material.dart';

class CarnetPage extends StatelessWidget {
  const CarnetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carnet Digital'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/carnet-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/carnet-qr.png',
                width: 260,
                height: 260,
              ),
              const SizedBox(height: 20),
              const Text(
                'BYRON MARCELO',
                style: TextStyle(
                  color: Color.fromARGB(195, 41, 69, 146),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1),
              const Text(
                'VALDIVIESO PAUCAR',
                style: TextStyle(
                  color: Color.fromARGB(195, 41, 69, 146),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'C.I.:1105201',
                style: TextStyle(
                  color: Color.fromARGB(195, 41, 69, 146),
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Estudiante  |  PRESENCIAL',
                style: TextStyle(
                  color: Color.fromARGB(195, 41, 69, 146),
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'COMPUTACION',
                style: TextStyle(
                  color: Color.fromARGB(195, 41, 69, 146),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/profile-avatar.png',
                width: 160,
                height: 160,
              ),
              const SizedBox(height: 15),
              const Text(
                'UTPL',
                style: TextStyle(
                  color: Color.fromARGB(195, 41, 69, 146),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
