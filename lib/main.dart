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

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final TextEditingController _controller = TextEditingController();

  String mensagemErro = '';
  String termoPesquisado = '';
  bool pesquisaRealizada = false;

  final List<Map<String, String>> receitas = [
    {
      'nome': 'Bolo de Chocolate',
      'tempo': '45 minutos',
    },
    {
      'nome': 'Lasanha',
      'tempo': '60 minutos',
    },
    {
      'nome': 'Panqueca',
      'tempo': '30 minutos',
    },
    {
      'nome': 'Brigadeiro',
      'tempo': '20 minutos',
    },
    {
      'nome': 'Bolo de Cenoura',
      'tempo': '50 minutos',
    },
  ];

  List<Map<String, String>> resultados = [];

  void pesquisarReceita() {
    String termo = _controller.text.trim();

    if (termo.isEmpty) {
      setState(() {
        mensagemErro =
            'Digite o nome de uma receita para pesquisar.';
      });
      return;
    }

    setState(() {
      mensagemErro = '';
      termoPesquisado = termo;
      pesquisaRealizada = true;

      resultados = receitas.where((receita) {
        return receita['nome']!
            .toLowerCase()
            .contains(termo.toLowerCase());
      }).toList();
    });
  }

  void novaConsulta() {
    setState(() {
      _controller.clear();
      mensagemErro = '';
      termoPesquisado = '';
      pesquisaRealizada = false;
      resultados = [];
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      appBar: AppBar(
        title: const Text('Receitas da Casa'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

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
                'Pesquise receitas simples e deliciosas.',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              const Text(
                'Pesquisar receitas',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Campo rotulado
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Nome da receita',
                  hintText: 'Ex.: Bolo de Chocolate',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (valor) {
                  if (mensagemErro.isNotEmpty) {
                    setState(() {
                      mensagemErro = '';
                    });
                  }
                },
                onSubmitted: (_) => pesquisarReceita(),
              ),

              const SizedBox(height: 10),

              // Mensagem de erro
              if (mensagemErro.isNotEmpty)
                Text(
                  mensagemErro,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),

              const SizedBox(height: 20),

              // Botões de pesquisa
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: pesquisarReceita,
                      icon: const Icon(Icons.search),
                      label: const Text('Pesquisar'),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: novaConsulta,
                      child: const Text('Nova consulta'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Resultado da pesquisa
              if (pesquisaRealizada) ...[
                const Text(
                  'Resultados da pesquisa',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Você pesquisou por: "$termoPesquisado"',
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 20),

                if (resultados.isEmpty)
                  const Text(
                    'Nenhuma receita encontrada. '
                    'Tente pesquisar outro nome.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepOrange,
                    ),
                  ),

                for (var receita in resultados)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.restaurant,
                          size: 35,
                          color: Colors.deepOrange,
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                receita['nome']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                'Tempo: ${receita['tempo']}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ] else ...[
                const Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Row(
                  children: [
                    Icon(Icons.cake, color: Colors.deepOrange),
                    SizedBox(width: 8),
                    Text('Doces'),
                    SizedBox(width: 25),
                    Icon(
                      Icons.restaurant,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(width: 8),
                    Text('Salgados'),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  'Receitas disponíveis',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                for (var receita in receitas)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.restaurant,
                          color: Colors.deepOrange,
                          size: 35,
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                receita['nome']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                'Tempo: ${receita['tempo']}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],

              const SizedBox(height: 25),

              const Center(
                child: Text(
                  'Feito para quem ama cozinhar!',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
