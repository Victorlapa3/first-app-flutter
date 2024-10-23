import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas'),
        ),
        body: ListView(
          children: [
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
                1),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                      child: Image.network(
                        widget.foto,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.nome,
                                  style: TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: (widget.dificuldade >= 1)
                                          ? Colors.blue
                                          : Colors.blue[100],
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: (widget.dificuldade >= 2)
                                          ? Colors.blue
                                          : Colors.blue[100],
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: (widget.dificuldade >= 3)
                                          ? Colors.blue
                                          : Colors.blue[100],
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: (widget.dificuldade >= 4)
                                          ? Colors.blue
                                          : Colors.blue[100],
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: (widget.dificuldade >= 5)
                                          ? Colors.blue
                                          : Colors.blue[100],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Container(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                          print(nivel);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              'UP',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: nivel / 10,
                      ),
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nivel: $nivel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
