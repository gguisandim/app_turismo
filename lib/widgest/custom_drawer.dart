import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearchBar;
  final VoidCallback toggleSearchBar;
  final int selectedIndex;
  final Function(int) onTabSelected;

  CustomAppBar({
    required this.showSearchBar,
    required this.toggleSearchBar,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: showSearchBar
          ? TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            )
          : Text('Borimbora'),
      centerTitle: true,
      backgroundColor: Colors.green,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(showSearchBar ? Icons.close : Icons.search),
          onPressed: toggleSearchBar,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Aumenta a altura do AppBar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => onTabSelected(0),
              child: Text(
                'Palácios',
                style: TextStyle(
                  color: selectedIndex == 0 ? Colors.white : Colors.white54,
                  fontSize: 21, // Aumenta o tamanho do texto
                ),
              ),
            ),
            SizedBox(width: 30), // Aumenta o espaçamento entre os botões
            TextButton(
              onPressed: () => onTabSelected(1),
              child: Text(
                'Palacetes',
                style: TextStyle(
                  color: selectedIndex == 1 ? Colors.white : Colors.white54,
                  fontSize: 21, // Aumenta o tamanho do texto
                ),
              ),
            ),
            SizedBox(width: 30), // Aumenta o espaçamento entre os botões
            TextButton(
              onPressed: () => onTabSelected(2),
              child: Text(
                'Eventos',
                style: TextStyle(
                  color: selectedIndex == 2 ? Colors.white : Colors.white54,
                  fontSize: 21, // Aumenta o tamanho do texto
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(100.0); // Aumenta a altura total do AppBar
}
