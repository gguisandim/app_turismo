import 'dart:math';
import 'package:flutter/material.dart';

class AleatorioPage extends StatelessWidget {
  final List<Map<String, String>> _items = [
    {'title': 'Antônio Lemos', 'imageUrl': 'lib/assets/antoniolemos.png'},
    {'title': 'Lauro Sodré', 'imageUrl': 'lib/assets/laurosodre.png'},
    {'title': 'Episcopal', 'imageUrl': 'lib/assets/episcopal.png'},
    {'title': 'Governadores', 'imageUrl': 'lib/assets/governadores.png'},
    {'title': 'Bolonha', 'imageUrl': 'lib/assets/bolonha.png'},
    {'title': 'Faciola', 'imageUrl': 'lib/assets/faciola.png'},
    {'title': 'Pinho', 'imageUrl': 'lib/assets/pinho.png'},
    {'title': 'Augusto Montenegro', 'imageUrl': 'lib/assets/augustomont.png'},
    {'title': 'Chermont', 'imageUrl': 'lib/assets/chermont.png'},
    {'title': 'Guilherme Paiva', 'imageUrl': 'lib/assets/guilhermepaiva.png'},
    {'title': 'Bibi Costa', 'imageUrl': 'lib/assets/bibicosta.png'},
    {'title': 'Pedro Gusmão', 'imageUrl': 'lib/assets/pedrogusmao.png'},
    {'title': 'Lourenço da Motta', 'imageUrl': 'lib/assets/lourenco.png'},
    {'title': 'Mac Dowell', 'imageUrl': 'lib/assets/macdowell.png'},
    {'title': 'Passarinho', 'imageUrl': 'lib/assets/passarinho.png'},
  ];

  void _showRandomItem(BuildContext context) {
    final random = Random();
    final randomIndex = random.nextInt(_items.length);
    final item = _items[randomIndex];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item['title'] ?? 'Sem título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(item['imageUrl'] ?? ''),
              SizedBox(height: 10),
              Text(item['title'] ?? 'Sem título'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aleatório'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showRandomItem(context),
              child: Text('Role Aleatório'),
            ),
          ],
        ),
      ),
    );
  }
}
