import 'package:flutter/material.dart';
import '../widgest/paginasmenu/favoritos_page.dart'; // Corrigir nome da pasta 'widgest' para 'widgets'
import '../widgest/paginasmenu/aleatorio_page.dart';
import '../widgest/paginasmenu/sobre_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritosPage(), // Passa uma lista vazia ou com itens
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Aleatório'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AleatorioPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SobrePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
