import 'package:flutter/material.dart';
import 'buttons.dart';

class PassarinhoPage extends StatefulWidget {
  @override
  _PassarinhoPageState createState() => _PassarinhoPageState();
}

class _PassarinhoPageState extends State<PassarinhoPage> {
  bool isFavorited = false;
  bool showHistory = false;
  bool showVirtualTour = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  void toggleHistory() {
    setState(() {
      showHistory = !showHistory;
      showVirtualTour = false;
    });
  }

  void toggleVirtualTour() {
    setState(() {
      showVirtualTour = !showVirtualTour;
      showHistory = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'lib/assets/passarinho.png',
                      fit: BoxFit.cover,
                      width: 150.0,
                      height: 200.0,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.attach_money, size: 20.0),
                          SizedBox(width: 8.0),
                          Text(
                            'Preço da entrada: Não há informações',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 20.0),
                          SizedBox(width: 8.0),
                          Text(
                            'Horário de visita: Permanentemente fechado',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 20.0),
                          SizedBox(width: 8.0),
                          Text(
                            'Local: Av.Gov.JoséMalcher - Nazaré, Belém - PA',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ActionButtons(
                isFavorited: isFavorited,
                toggleFavorite: toggleFavorite,
                onCurtirPressed: () {},
                onCompartilharPressed: () {},
              ),
              SizedBox(height: 16.0),
              if (showHistory)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'O Palacete Passarinho é um dos edifícios históricos de Belém que reflete o estilo arquitetônico e a opulência da época em que foi construído. O nome “Passarinho” está associado a Antonio Passarinho, um destacado empresário e político de Belém no início do século XX. Antonio Passarinho era conhecido por suas atividades no comércio e por seu papel como um influente membro da sociedade paraense. Ele aproveitou a prosperidade do ciclo da borracha para acumular uma significativa fortuna, que investiu na construção de sua residência. ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              if (showVirtualTour)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Clique aqui para iniciar o passeio virtual: [Link para o passeio virtual]',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: toggleHistory,
                child: Text(showHistory ? 'Esconder História' : 'Ver História'),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: toggleVirtualTour,
                child: Text(showVirtualTour
                    ? 'Esconder Passeio Virtual'
                    : 'Ver Passeio Virtual'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
