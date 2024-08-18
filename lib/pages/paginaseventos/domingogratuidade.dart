import 'package:flutter/material.dart';

class DomingoGratuidadePage extends StatefulWidget {
  @override
  _DomingoGratuidadePageState createState() => _DomingoGratuidadePageState();
}

class _DomingoGratuidadePageState extends State<DomingoGratuidadePage> {
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
        title: Text('Domingo da Gratuidade'),
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
                child: Image.network(
                  'https://via.placeholder.com/600x400.png?text=Domingo+da+gratuidade',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'O Domingo da Gratuidade é um evento especial que ocorre em diversos museus e instituições culturais, oferecendo entrada gratuita para todos os visitantes durante o dia. Este evento tem como objetivo incentivar a visitação e o acesso à cultura para um público mais amplo.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              if (showDetails)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Detalhes do Evento: No Domingo da Gratuidade, os visitantes podem explorar exposições permanentes e temporárias sem custo. Além disso, muitas instituições oferecem atividades educativas e eventos especiais como palestras, oficinas e apresentações culturais durante o dia. Verifique a programação específica do museu ou instituição participante para mais informações sobre horários e atividades.',
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
