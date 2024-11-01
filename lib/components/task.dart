import 'package:flutter/material.dart';
import 'package:meu_app/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, int dificuldade, {super.key})
      : dificuldade = dificuldade > 0 ? dificuldade : 1;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  final _corSelecionadoNotifier = ValueNotifier<Color>(Colors.green);

  @override
  void dispose() {
    _corSelecionadoNotifier.dispose();
    super.dispose();
  }

  void _atualizarCor() {
    int maxNivel = widget.dificuldade * 10;

    if (nivel <= maxNivel / 3) {
      _corSelecionadoNotifier.value = Colors.green;
    } else if (nivel <= (2 * maxNivel) / 3) {
      _corSelecionadoNotifier.value = Colors.orange;
    } else {
      _corSelecionadoNotifier.value = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    int maxNivel = widget.dificuldade * 10;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ValueListenableBuilder(
              valueListenable: _corSelecionadoNotifier,
              builder: (context, Color corSelecionado, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: corSelecionado,
                  ),
                  height: 140,
                );
              }
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(height: 8),
                            Difficulty(dificultyLevel: widget.dificuldade),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (nivel < maxNivel) {
                              nivel++;
                              _atualizarCor();
                            }
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0) ? (nivel / maxNivel) : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      nivel >= maxNivel ? 'Level Máximo: $maxNivel'  : 'Nível: $nivel',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
