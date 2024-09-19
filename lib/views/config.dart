import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        shape: const BorderDirectional(
          bottom: BorderSide(width: 3, color: Colors.black12),
        ),
      ),
    );
  }
}
