import 'package:flutter/material.dart';
import '../widgest/custom_drawer.dart';
import '../widgest/search_app_bar.dart';
import '../pages/films_page.dart';
import '../pages/review.page.dart';
import '../pages/eventos_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSearchBar = false;
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showSearchBar: _showSearchBar,
        toggleSearchBar: () {
          setState(() {
            _showSearchBar = !_showSearchBar;
          });
        },
        selectedIndex: _selectedIndex,
        onTabSelected: _onTabSelected,
      ),
      drawer: CustomDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          PalacioPage(),
          PalacetePage(),
          EventosPage(),
        ],
      ),
    );
  }
}
