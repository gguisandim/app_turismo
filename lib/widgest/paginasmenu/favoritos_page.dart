import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as List<Map<String, String>>?;
    final favorites = arguments ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 4.0,
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                'Nenhum favorito adicionado ainda.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    leading: Image.asset(favorite['image']!,
                        width: 50.0, height: 50.0, fit: BoxFit.cover),
                    title: Text(
                      favorite['name']!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Adicione ações ao tocar no item, se necessário
                    },
                  ),
                );
              },
            ),
    );
  }
}
