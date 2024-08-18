import 'package:flutter/material.dart';
import 'package:app_turismo/widgest/paginasmenu/favoritos_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Cor de fundo
            foregroundColor: Colors.white, // Cor do texto
            minimumSize: Size(120, 40),
          ),
        ),
      ),
      routes: {
        '/favoritos': (context) => FavoritosPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> favorites = [];
  bool isFavorited = false;

  void toggleFavorite(String palaceName, String palaceImage) {
    setState(() {
      isFavorited = !isFavorited;
      if (isFavorited) {
        favorites.add({'name': palaceName, 'image': palaceImage});
      } else {
        favorites.removeWhere((item) => item['name'] == palaceName);
      }
    });
  }

  void _navigateToFavoritos() {
    Navigator.pushNamed(
      context,
      '/favoritos',
      arguments: favorites, // Passa a lista de favoritos como argumento
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Buttons')),
      body: ActionButtons(
        isFavorited: isFavorited,
        toggleFavorite: () => toggleFavorite(
            'Palacete Exemplo', 'lib/assets/palacete_exemplo.png'),
        onCurtirPressed: () {},
        onCompartilharPressed: () {},
        palaceName: 'Palacete Exemplo',
        palaceImage: 'lib/assets/palacete_exemplo.png',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToFavoritos,
        child: Icon(Icons.favorite),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final bool isFavorited;
  final VoidCallback toggleFavorite;
  final VoidCallback onCurtirPressed;
  final VoidCallback onCompartilharPressed;
  final String palaceName;
  final String palaceImage;

  ActionButtons({
    required this.isFavorited,
    required this.toggleFavorite,
    required this.onCurtirPressed,
    required this.onCompartilharPressed,
    required this.palaceName,
    required this.palaceImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16.0),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onCurtirPressed,
                child: Row(
                  children: [
                    Icon(Icons.thumb_up),
                    SizedBox(width: 8.0),
                    Text('Curtir'),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  toggleFavorite();
                  if (isFavorited) {
                    Navigator.pushNamed(
                      context,
                      '/favoritos',
                      arguments: [
                        {'name': palaceName, 'image': palaceImage}
                      ],
                    );
                  }
                },
                child: Row(
                  children: [
                    Icon(isFavorited ? Icons.star : Icons.star_border),
                    SizedBox(width: 8.0),
                    Text('Favoritar'),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: onCompartilharPressed,
                child: Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(width: 8.0),
                    Text('Compartilhar'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
