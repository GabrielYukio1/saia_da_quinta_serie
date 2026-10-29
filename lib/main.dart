
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      // Barra superior do aplicativo
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: const Text('Receitas da Casa'),
        centerTitle: true,
      ),

      // Conteúdo principal
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Bem-vindo ao Receitas da Casa!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Encontre receitas simples e deliciosas para preparar em casa.',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              // Área de pesquisa visual
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      'Pesquisar receitas...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Categorias',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Categorias
              const Row(
                children: [
                  Icon(Icons.cake, color: Colors.deepOrange),
                  SizedBox(width: 8),
                  Text('Doces'),
                  SizedBox(width: 25),
                  Icon(Icons.restaurant, color: Colors.deepOrange),
                  SizedBox(width: 8),
                  Text('Salgados'),
                ],
              ),

              const SizedBox(height: 15),

              const Row(
                children: [
                  Icon(Icons.local_drink, color: Colors.deepOrange),
                  SizedBox(width: 8),
                  Text('Bebidas'),
                  SizedBox(width: 25),
                  Icon(Icons.eco, color: Colors.deepOrange),
                  SizedBox(width: 8),
                  Text('Saudáveis'),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Receitas populares',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Receita 1
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.cake,
                      size: 45,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bolo de Chocolate',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Tempo: 45 minutos'),
                      ],
                    ),
                  ],
                ),
              ),

              // Receita 2
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.restaurant,
                      size: 45,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lasanha',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Tempo: 60 minutos'),
                      ],
                    ),
                  ],
                ),
              ),

              // Receita 3
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.breakfast_dining,
                      size: 45,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Panqueca',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Tempo: 30 minutos'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.deepOrange,
                  ),
                  SizedBox(width: 8),
                  Text('Feito para quem ama cozinhar!'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
