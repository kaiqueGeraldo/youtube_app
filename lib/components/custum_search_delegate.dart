// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class CustumSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.microtask(() {
      close(context, query);
    });
    return Center(
      child: Text('Você pesquisou: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();

    // List<String> lista = [];

    // if (query.isNotEmpty) {
    //   lista = ['Android', 'Android navegação', 'IOS', 'Jogos']
    //       .where((text) => text.toLowerCase().startsWith(query.toLowerCase()))
    //       .toList();

    //   return ListView.builder(
    //     itemCount: lista.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         onTap: () {
    //           close(
    //             context,
    //             lista[index],
    //           );
    //         },
    //         title: Text(lista[index]),
    //       );
    //     },
    //   );
    // } else {
    //   return const Center(
    //     child: Text('Nenhum resultado para pesquisa'),
    //   );
    // }
  }
}
