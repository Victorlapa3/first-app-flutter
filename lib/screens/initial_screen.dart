import 'package:flutter/material.dart';
import 'package:meu_app/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/flutter.png',
                3),
            Task(
                'Aprender testes automatizados',
                'assets/images/testes.png',
                3),
            Task(
                'Ler livros de persuasão',
                'assets/images/livros.png',
                2),
            Task(
                'Aprender inglês',
                'assets/images/ingles.jpg',
                4),
            Task(
                'Jogar no PC',
                'assets/images/jogar.jpg',
                0),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
