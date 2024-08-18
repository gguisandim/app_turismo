import 'package:flutter/material.dart';
import 'buttons.dart';

class GuilhermePaivaPage extends StatefulWidget {
  @override
  _GuilhermePaivaPageState createState() => _GuilhermePaivaPageState();
}

class _GuilhermePaivaPageState extends State<GuilhermePaivaPage> {
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
      showVirtualTour =
          false; // Garante que apenas um conteúdo é exibido de cada vez
    });
  }

  void toggleVirtualTour() {
    setState(() {
      showVirtualTour = !showVirtualTour;
      showHistory =
          false; // Garante que apenas um conteúdo é exibido de cada vez
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Palacete Guilherme Paiva"), // Adicionado título
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
                      'lib/assets/guilhermepaiva.png', // Verifique se a imagem está no caminho correto
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
                            'Preço da entrada: Não há informações.',
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
                            'Horário de visita: Não está aberto para visitaão.',
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
                            'Local: TV.Dr.Moraes,32 - Nazaré, Belém - PA',
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
              ),
              SizedBox(height: 16.0),
              if (showHistory)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' A construção do Palacete Guilherme Paiva começou em 1908 e foi concluída em 1911. O edifício foi projetado para ser uma residência opulenta que refletisse o sucesso e o prestígio de Paiva na sociedade paraense. A arquitetura do palacete é um exemplo do estilo eclético, com influências neoclássicas e revivalistas. A fachada é ornamentada com detalhes refinados, incluindo colunas e molduras elaboradas, enquanto o interior é decorado com acabamentos de alta qualidade e móveis sofisticados.O palacete não serviu apenas como uma residência, mas também como um símbolo do status de Paiva e da riqueza acumulada durante o auge econômico da região. A influência de Paiva se estendeu além de seus empreendimentos comerciais; ele foi um patrono das artes e apoiou diversas iniciativas culturais em Belém.Após a morte de Guilherme Paiva em 1922, o palacete passou por diferentes proprietários e usos, mas continua a ser um importante marco histórico em Belém. O edifício é uma lembrança da era dourada da borracha e da opulência dos empresários da época.',
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
