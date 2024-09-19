import 'package:app_youtube/components/custum_search_delegate.dart';
import 'package:app_youtube/views/biblioteca.dart';
import 'package:app_youtube/views/config.dart';
import 'package:app_youtube/views/em_alta.dart';
import 'package:app_youtube/views/inicio.dart';
import 'package:app_youtube/views/inscricao.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(pesquisa: _resultado),
      const EmAlta(),
      const Inscricao(),
      const Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        shape: const BorderDirectional(
            bottom: BorderSide(width: 3, color: Colors.black12)),
        backgroundColor: Colors.white,
        title: Image.network(
            width: 120,
            'https://logodownload.org/wp-content/uploads/2014/10/youtube-logo-4-3.png'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustumSearchDelegate());
                setState(() {
                  _resultado = res!;
                });
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Config(),
                    ));
              },
              icon: const Icon(Icons.account_circle)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          child: telas[_indiceAtual],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _indiceAtual,
          onTap: (index) {
            setState(() {
              _indiceAtual = index;
            });
          },
          fixedColor: Colors.red,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
            BottomNavigationBarItem(
                icon: Icon(Icons.whatshot), label: 'Em Alta'),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), label: 'Inscrições'),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder), label: 'Biblioteca'),
          ]),
    );
  }
}
