import 'package:flutter/material.dart';
import 'buttons.dart'; // Corrija a importação se necessário

class AntonioLemosPage extends StatefulWidget {
  @override
  _AntonioLemosPageState createState() => _AntonioLemosPageState();
}

class _AntonioLemosPageState extends State<AntonioLemosPage> {
  bool isFavorited = false;
  bool showHistory = false;
  bool showVirtualTour = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      if (isFavorited) {
        // Adiciona o Palacete Antônio Lemos à lista de favoritos
        Navigator.pushNamed(
          context,
          '/favoritos',
          arguments: [
            {
              'name': 'Palacete Antônio Lemos',
              'image': 'lib/assets/antoniolemos.png',
            }
          ],
        );
      }
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
        title: Text('Palacete Antônio Lemos'),
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
                      'lib/assets/antoniolemos.png',
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
                            'Preço da entrada: Gratuita',
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
                            'Horário de visita: Em dias de semana, das 8h30 às 14h, aos domingos das 09h às 13h',
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
                            'Local: Praça Dom Pedro II, 2 - Cidade Velha, Belém - PA',
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
                onCurtirPressed: () {
                  // Adicione a ação desejada para curtir
                },
                onCompartilharPressed: () {
                  // Adicione a ação desejada para compartilhar
                },
                palaceName: 'Palacete Antônio Lemos',
                palaceImage: 'lib/assets/antoniolemos.png',
              ),
              SizedBox(height: 16.0),
              if (showHistory)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Antônio Lemos, o nome por trás do Palacete Antônio Lemos, foi uma figura central na história econômica e política de Belém, durante o final do século XIX e início do século XX. Nascido em 1851, Lemos era um dos grandes empresários e políticos da época, cuja influência se estendia além dos limites da cidade. Ele era conhecido principalmente por seu papel como prefeito de Belém, cargo que ocupou em duas ocasiões: entre 1890 e 1891 e novamente de 1892 a 1896.Lemos se destacou como um importante representante da elite econômica local, tendo feito fortuna através do ciclo da borracha. Ele também se envolveu em vários empreendimentos, no qual acumulou uma grande fortuna, pois era um astuto empresário e político, com uma visão clara para o desenvolvimento da cidade.O ciclo da borracha, que começou no final do século XIX, trouxe uma onda de riqueza para a Amazônia, transformando a economia da região e colocando Belém no mapa internacional como um centro econômico de importância. .',
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
