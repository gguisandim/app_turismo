import 'package:flutter/material.dart';
import '../pages/paginaspalacio/antoniolemos.dart';
import '../pages/paginaspalacio/laurosodre.dart';
import '../pages/paginaspalacio/episcopal.dart';
import '../pages/paginaspalacio/governadores.dart';

class PalacioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:
            true, // Mantém o título centralizado, caso seja adicionado posteriormente
      ),
      body: Center(
        child: LetterboxdStyleColumn(),
      ),
    );
  }
}

class LetterboxdStyleColumn extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'title': 'Antônio Lemos', 'imageUrl': 'lib/assets/antoniolemos.png'},
    {'title': 'Lauro Sodré', 'imageUrl': 'lib/assets/laurosodre.png'},
    {'title': 'Episcopal', 'imageUrl': 'lib/assets/episcopal.png'},
    {'title': 'Governadores', 'imageUrl': 'lib/assets/governadores.png'},
  ];

  void _navigateToPage(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = AntonioLemosPage();
        break;
      case 1:
        page = LauroSodrePage();
        break;
      case 2:
        page = EpiscopalPage();
        break;
      case 3:
        page = GovernadoresPage();
        break;
      default:
        page = Placeholder(); // Página padrão
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => _navigateToPage(context, index),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  items[index]['title']!,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      items[index]['imageUrl']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180.0,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
