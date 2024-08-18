import 'package:flutter/material.dart';

class UmaNoiteNoMuseuPage extends StatefulWidget {
  @override
  _UmaNoiteNoMuseuPageState createState() => _UmaNoiteNoMuseuPageState();
}

class _UmaNoiteNoMuseuPageState extends State<UmaNoiteNoMuseuPage> {
  bool isFavorited = false;
  bool showDetails = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  void toggleDetails() {
    setState(() {
      showDetails = !showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uma Noite no Museu'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isFavorited ? Icons.favorite : Icons.favorite_border),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'lib/assets/umanoite.jpg', // Substitua pelo caminho correto da imagem
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Uma noite no museu é um evento especial que ocorre no [Nome do Museu]. É uma oportunidade única para explorar as exposições e coleções do museu durante a noite, com atividades e atrações exclusivas para os visitantes.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              if (showDetails)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Detalhes do Evento: O evento "Uma Noite no Museu" oferece uma série de atividades interativas, visitas guiadas especiais e apresentações culturais. Os participantes têm a chance de ver o museu sob uma nova perspectiva e participar de atividades envolventes que são projetadas para todos os públicos.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: toggleDetails,
                child: Text(showDetails ? 'Esconder Detalhes' : 'Ver Detalhes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
