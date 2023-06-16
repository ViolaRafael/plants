import 'package:flutter/material.dart';
import 'package:plants/screens/plant/plant.dart';
import 'package:plants/screens/plant/qrCode.dart';
import 'package:plants/screens/plant/quiz.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF54845C), // Definindo a cor de fundo como #54845c
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlantPage()),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF4E454)), // Definindo a cor do botão como #f4e454
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)), // Definindo o tamanho mínimo do botão como 200x60
              ),
              child: const Text(
                'Lista de plantas',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20), // Espaço entre os botões
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QrCodePage()),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF4E454)), // Definindo a cor do botão como #f4e454
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)), // Definindo o tamanho mínimo do botão como 200x60
              ),
              child: const Text(
                'Ler planta',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20), // Espaço entre os botões
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizApp()),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF4E454)), // Definindo a cor do botão como #f4e454
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)), // Definindo o tamanho mínimo do botão como 200x60
              ),
              child: const Text(
                'Quiz',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}