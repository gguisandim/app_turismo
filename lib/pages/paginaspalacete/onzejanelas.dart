import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  DetailPage(
      {required this.title, required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 200.0,
                  height: 300.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Adicione a ação desejada
                  },
                  child: Text('Curtir'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Adicione a ação desejada
                  },
                  child: Text('Compartilhar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
