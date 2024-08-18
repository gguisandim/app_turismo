import 'package:flutter/material.dart';
import 'buttons.dart';

class PedroGusmaoPage extends StatefulWidget {
  @override
  _PedroGusmaoPageState createState() => _PedroGusmaoPageState();
}

class _PedroGusmaoPageState extends State<PedroGusmaoPage> {
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
                      'lib/assets/pedrogusmao.png',
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
                            'Horário de visita: 9h às 13h e 14h às 16h',
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
                            'Local: Av. Sra. de Nazaré, 138 - Nazaré, Belém - PA',
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
                    'Pedro Gusmão, nascido em 1875, foi um destacado comerciante e político de Belém, Pará. Ele acumulou uma significativa fortuna através do comércio de borracha e café, setores que foram fundamentais para a economia da região durante o ciclo da borracha.O Palacete Pedro Gusmão foi construído entre 1910 e 1913, e o edifício serviu como uma residência luxuosa que refletia o sucesso e o status de Gusmão. A arquitetura do palacete é um exemplo do estilo eclético, combinando elementos neoclássicos com detalhes revivalistas. A fachada do edifício é adornada com colunas e ornamentos elaborados, enquanto o interior é decorado com acabamentos de alta qualidade e móveis sofisticados.',
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
