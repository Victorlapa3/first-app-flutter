import 'package:flutter/material.dart';
import 'package:meu_app/task.dart';

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
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            Task(
                'Aprender testes automatizados',
                'https://img.freepik.com/free-photo/computer-program-coding-screen_53876-138060.jpg?t=st=1729708112~exp=1729711712~hmac=d03d7395466f9bfdef5c33b64dbda00e930ad01963650c7dfdd21f8beb2f9e1a&w=740',
                3),
            Task(
                'Ler livros de persuasão',
                'https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg?t=st=1729707781~exp=1729711381~hmac=c2bbcb17c0f2cffa0e177bccc927146daf3ed7b6331a1deb4b7d1cc79c44d8bc&w=740',
                2),
            Task(
                'Aprender inglês',
                'https://img.freepik.com/free-photo/english-books-resting-table-working-space_23-2149429590.jpg?t=st=1729708196~exp=1729711796~hmac=258b3257c5461d58c58c5cb26496088865e24eb9d00fdf055bb9376cd7aa0143&w=826',
                4),
            Task(
                'Jogar no PC',
                'https://as2.ftcdn.net/v2/jpg/08/87/53/41/1000_F_887534183_85vAonO7XSO9lKKs8bSFcXsonLWKl1iI.jpg',
                0),
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
