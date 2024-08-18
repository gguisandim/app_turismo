import 'package:flutter/material.dart';
import '../pages/paginaseventos/umanoitenomuseu.dart';
import '../pages/paginaseventos/domingogratuidade.dart';

class EventosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
        centerTitle: true,
      ),
      body: Center(
        child: LetterboxdStyleColumn(),
      ),
    );
  }
}

class LetterboxdStyleColumn extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Uma noite no museu',
      'imageUrl': 'lib/assets/umanoite.jpg',
      'isLocal': 'true',
    },
    {
      'title': 'Domingo da gratuidade',
      'imageUrl':
          'https://via.placeholder.com/600x400.png?text=Domingo+da+gratuidade',
      'isLocal': 'false',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UmaNoiteNoMuseuPage(),
                  ),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DomingoGratuidadePage(),
                  ),
                );
              }
            },
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
                    child: items[index]['isLocal'] == 'true'
                        ? Image.asset(
                            items[index]['imageUrl']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 180.0,
                          )
                        : Image.network(
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
